// const fetch = require('node-fetch') 
//根据ip定位定位  只能获取到经纬度和省份城市  不能获取到具体位置 还需要调用下面接口获取具体位置
const tencentkey = 'RLHBZ-WMPRP-Q3JDS-V2IQA-JNRFH-EJBHL'
const tencentkey2 = 'RRXBZ-WC6KF-ZQSJT-N2QU7-T5QIT-6KF5X'

function getLocation(req, res, next) {
    let ip = req.ip;
    const ipArr = ip.split(':')                  //切割字符串提取ip
    ip = ipArr[ipArr.length - 1]
    if (process.env.NODE_ENV == 'dev') {    //开发环境
        ip = '113.105.128.251';
    }
    try {
        let result;
        //根据ip地址请求获取数据
        result = fetch('https://apis.map.qq.com/ws/location/v1/ip', {
            ip,
            key: tencentkey,
        });
        if (result.status !== 0) {
            result = fetch('https://apis.map.qq.com/ws/location/v1/ip', {
                ip,
                key: tencentkey2,
            })
        }
        //status===0表示请求成功
        if (result.status === 0) {
            const cityInfo = {
                lat: result.result.location.lat,    //纬度
                lng: result.result.location.lng,    //经度
                city: result.result.ad_info.city,
            }
            cityInfo.city = cityInfo.city.replace(/市$/, '');
            return cityInfo;
        } else {
            console.log('定位失败', result)
            res.send({
                status: -1,
                message: '定位失败'
            })
        }
    } catch (err) {
        console.log('定位失败', err);
        res.send({
            status: -1,
            message: '定位失败'
        })
    }
}
//根据经纬度获取详细地址信息
 function getDetailPosition(location, res) {
    if (location) {
        try {
            let cityInfo = fetch('https://apis.map.qq.com/ws/geocoder/v1', {
                location: location.lat + ',' + location.lng,
                key: tencentkey
            }, 'GET');
            let address = cityInfo.result.address.replace(/^.{2}省/, '');
            let data = {         //返回前端的数据
                address,
                location
            }
            return data;
        } catch (err) {
            console.log('获取位置失败', err);
            res.send({
                status: -1,
                message: '获取定位失败'
            })
        }
    }
}
//根据关键词搜索位置
function locationSearch(keyword) {
    try {
        let reqData = {
            keyword: encodeURI(keyword),
            key: tencentkey,
            policy: 1
        }
        let data = fetch('https://apis.map.qq.com/ws/place/v1/suggestion', reqData, "GET");
        return data;
    } catch (err) {
        console.log('搜索位置出错', err);

    }
}
module.exports = {
    getLocation,
    getDetailPosition,
    locationSearch
}