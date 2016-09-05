<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<!--   设置编码-->
    <meta charset="UTF-8">
    <!--    使页面在手机访问的时候自适应-->
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>发起</title>
    <!--    页面的标签栏处的小图标-->
    <link rel='shortcut icon' href='/public/imgs/logo32.png'>

    <!--    bootstrap基础样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/bootstrap/bootstrap.min.css">
    <!--    button样式引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/button/buttons.css">
    <!--    警告提示框的样式文件-->
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger.css">
    <link rel="stylesheet" type="text/css" href="/public/lib/messenger/css/messenger-theme-air.css">
    <!--    字体标签库引入-->
    <link rel="stylesheet" type="text/css" href="/public/lib/iconfont/iconfont.css">

    <!--   自定义样式总和引入-->
    <link rel="stylesheet" type="text/css" href="/public/css/index.css">

  </head>
  
  <body>
	<a id="hide_save_back_a" href="/user/proj?reason=1&hasCollect=0&state=1&type=0"></a>
	<a id="hide_submit_back_a" href="/user/proj?reason=1&hasCollect=0&state=2&type=0"></a>

    <div class="primary row">
        <div class="create-intr">
            <span class="intr-info">
            众筹时间默认为30天。在此期间，当众筹金额达到设定数值后将自动关闭众筹；若到达众筹时间众筹金额未达到设定数值，则认为众筹失败同时将自动关闭众筹。
           </span>
            <a class="intr-a" href="javascript:void(0)">
                <i class="icon icon-xinghao line-intr-emp"></i>
                为必填项
            </a>
        </div>
        <div class="intr-cont">

            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_name" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        项目名称
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
                    </span>
                </a>
            </div>
            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_money" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        众筹金额
                    </span>
                    <span id="proj_momey_text" class="line-tip">
    <!--                    <i class="icon icon-goto"></i>-->
                        10万
                    </span>
                </a>
            </div>
        </div>
        <div class="intr-cont">

            <div class="intr-line-box">
            	<!-- data-open-input="open" --> 
                <a data-mapping-id="hide_proj_sell_stock" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        出让股份
                    </span>
                    <span id="hide_proj_sell_stock_text" class="line-tip">
<!--                        <i class="icon icon-goto"></i>-->
                        少于10%
                    </span>
                </a>
            </div>
            <div class="intr-line-box">
             	<!-- data-open-input="open" -->
                <a data-mapping-id="hide_proj_count_product" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        发售数量
                    </span>
                    <span id="hide_proj_count_product_text" class="line-tip">
    <!--                    <i class="icon icon-goto"></i>-->
                        不超过200份
                    </span>
                </a>
            </div>
        </div>
        <div class="intr-cont">
            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_des_img" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        项目图片
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
<!--                        少于10%-->
                    </span>
                </a>
            </div>
            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_describe" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        项目描述
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
<!--                        少于10%-->
                    </span>
                </a>
            </div>
        </div>
        <div class="intr-cont">
            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_founder_img" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        创始人图片
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
<!--                        少于10%-->
                    </span>
                </a>
            </div>
            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_founder_des" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        关于创始人
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
<!--                        少于10%-->
                    </span>
                </a>
            </div>
        </div>
        <div class="intr-cont">

            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_repay_explain" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <i class="icon icon-xinghao line-intr-emp"></i>
                        回报说明
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
<!--                        少于10%-->
                    </span>
                </a>
            </div>
        </div>

        <div class="intr-cont">
            <div class="intr-news-box">
                <div class="intr-news-info">
                    <i class="icon icon-xinghao news-intr-emp"></i>
                    <span class="news-intr-info">
                        身份证明
                        <a class="news-info-other" href="javascript:void(0)">
                            (请上传本人手持身份证照片以便我们审核信息的真实性,该信息不会对外泄露.)
                        </a>
                    </span>
                </div>
                <div class="intr-news-img">
                    <a id="id_card_show" data-img-input="open" data-mapping-id="id_card" data-mapping-id-show="id_card_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao intr-news-img-icon"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="intr-cont">
            <div class="intr-news-box">
                <div class="intr-news-info">
                    <i class="icon icon-xinghao news-intr-emp"></i>
                    <span class="news-intr-info">
                        微信二维码
                        <a class="news-info-other" href="javascript:void(0)">
                            (请上传本人微信二维码,以便支持者联系)
                        </a>
                    </span>
                </div>
                <div class="intr-news-img">
                    <a id="wechat_dimen_show" data-img-input="open" data-mapping-id="wechat_dimen" data-mapping-id-show="wechat_dimen_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao intr-news-img-icon"></i>
                    </a>
                    <!--                    <img class="intr-news-img-img" src="/public/imgs/wechat_2d_barcode.png" alt="">-->
                </div>
            </div>
        </div>

        <div class="intr-cont">

            <div class="intr-line-box">
                <a data-open-input="open" data-mapping-id="hide_proj_warning" class="link-box" href="javascript:void(0)">
                    <span class="line-intr-label" for="">
                        <!-- <i class="icon icon-xinghao line-intr-emp"></i> -->
                        注意事项
                    </span>
                    <span class="line-tip">
                        <i class="icon icon-goto"></i>
<!--                        少于10%-->
                    </span>
                </a>
            </div>
        </div>
    </div>

    <div class="bottom-info bottom-box container-fluid">
        <div class="row bottom-button-box">
            <a data-page-button="save" href="javascript:void(0)" class="bottom-icon-box icol-xs-5 bottom-buttom-a-item">
                保存
            </a> 
            <a data-page-button="submit" href="javascript:void(0)" class="bottom-icon-box icol-xs-5 bottom-buttom-a-item">
                提交
            </a> 
        </div>
    </div>

    <!--    图片上传的公共调用input框-->
    <!-- <input type="file" id="upload_img" accept="image/*;capture=camera" /> -->
    <input class="hide" type="file" id="upload_img" name="myfiles" accept="image/png,image/jpe,image/jpg,image/jpeg" />

    <!--    项目名称输入框-->
    <div id="hide_proj_name" class="page-input-cont hide">
        <div class="page-input-box">
            <textarea id="hide_proj_name_value" name="" class="page-input-box-cont" rows="4" placeholder='请输入项目名称'></textarea>
            <span class="right-bottom-corner-tip">50字</span>
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_name" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--    众筹金额输入框-->
    <div id="hide_proj_money" class="page-input-cont hide">
        <input type="text" id="proj_money_value" value="10" class="hide" />
        <dl class="page-input-select-box">
            <a data-select-item="item" data-mapping-id="hide_proj_money" data-option-value="10" class="page-input-select-item checked" href="javascript:void(0)" style="display: block;">10万</a>
            <a data-select-item="item" data-mapping-id="hide_proj_money" data-option-value="20" class="page-input-select-item" href="javascript:void(0)" style="display: block;">20万</a>
        </dl>
    </div>

    <!--    出让股份输入框-->
    <div id="hide_proj_sell_stock" class="page-input-cont hide">
        <div class="page-input-box">
            <input value="5" id="hide_proj_sell_stock_value" class="page-input-box-cont" placeholder='出让的股份(少于10%)' type="text" />
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_sell_stock" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--    发售数量输入框-->
    <div id="hide_proj_count_product" class="page-input-cont hide">
        <div class="page-input-box">
            <input value="100" id="hide_proj_count_product_value" class="page-input-box-cont" placeholder='发售数量(不超过200份)' type="text" />
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_count_product" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--   项目图片-->
    <div id="hide_proj_des_img" class="page-input-cont hide">
        <div class="page-news-box">
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_des_img_1_show" data-img-input="open" data-mapping-id="proj_des_img_1" data-mapping-id-show="proj_des_img_1_show" href="javascript:void(0)" style="display:block">
                        <!--                       <img class="intr-news-img-img" src="/public/imgs/wechat_2d_barcode.png" alt="">-->
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_des_img_2_show" data-img-input="open" data-mapping-id="proj_des_img_2" data-mapping-id-show="proj_des_img_2_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_des_img_3_show" data-img-input="open" data-mapping-id="proj_des_img_3" data-mapping-id-show="proj_des_img_3_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_des_img_4_show" data-img-input="open" data-mapping-id="proj_des_img_4" data-mapping-id-show="proj_des_img_4_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_des_img_5_show" data-img-input="open" data-mapping-id="proj_des_img_5" data-mapping-id-show="proj_des_img_5_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_des_img_6_show" data-img-input="open" data-mapping-id="proj_des_img_6" data-mapping-id-show="proj_des_img_6_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_des_img" href="javascript:void(0)" class="input-button">完成</a>
        </div>
        <input class="hide" type="text" id="proj_des_img_1" placeholder='项目图片' />
        <input class="hide" type="text" id="proj_des_img_2" placeholder='项目图片' />
        <input class="hide" type="text" id="proj_des_img_3" placeholder='项目图片' />
        <input class="hide" type="text" id="proj_des_img_4" placeholder='项目图片' />
        <input class="hide" type="text" id="proj_des_img_5" placeholder='项目图片' />
        <input class="hide" type="text" id="proj_des_img_6" placeholder='项目图片' />
    </div>

    <!--    项目描述-->
    <div id="hide_proj_describe" class="page-input-cont hide">
        <div class="page-input-box">
            <textarea id="hide_proj_describe_value" name="abc" class="page-input-box-cont" rows="6" placeholder='绘声绘色的描述一下你的项目吧...'></textarea>
            <!--           <span class="right-bottom-corner-tip">280字</span>-->
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_describe" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--    创始人图片-->
    <div id="hide_proj_founder_img" class="page-input-cont hide">
        <div class="page-news-box">
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_founder_img_1_show" data-img-input="open" data-mapping-id="proj_founder_img_1" data-mapping-id-show="proj_founder_img_1_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_founder_img_2_show" data-img-input="open" data-mapping-id="proj_founder_img_2" data-mapping-id-show="proj_founder_img_2_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_founder_img_3_show" data-img-input="open" data-mapping-id="proj_founder_img_3" data-mapping-id-show="proj_founder_img_3_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_founder_img_4_show" data-img-input="open" data-mapping-id="proj_founder_img_4" data-mapping-id-show="proj_founder_img_4_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_founder_img_5_show" data-img-input="open" data-mapping-id="proj_founder_img_5" data-mapping-id-show="proj_founder_img_5_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
            <div class="page-news-img-box">
                <div class="page-news-imgs-item">
                    <a id="proj_founder_img_6_show" data-img-input="open" data-mapping-id="proj_founder_img_6" data-mapping-id-show="proj_founder_img_6_show" href="javascript:void(0)" style="display:block">
                        <i class="icon icon-jiahao page-news-img-icon"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_founder_img" href="javascript:void(0)" class="input-button">完成</a>
        </div>
        <input class="hide" type="text" id="proj_founder_img_1" placeholder='创始人图片' />
        <input class="hide" type="text" id="proj_founder_img_2" placeholder='创始人图片' />
        <input class="hide" type="text" id="proj_founder_img_3" placeholder='创始人图片' />
        <input class="hide" type="text" id="proj_founder_img_4" placeholder='创始人图片' />
        <input class="hide" type="text" id="proj_founder_img_5" placeholder='创始人图片' />
        <input class="hide" type="text" id="proj_founder_img_6" placeholder='创始人图片' />
    </div>
    <!--    创始人介绍-->
    <div id="hide_proj_founder_des" class="page-input-cont hide">
        <div class="page-input-box">
            <textarea id="hide_proj_founder_des_value" name="abc" class="page-input-box-cont" rows="6" placeholder='介绍一下优秀的创始人吧...'></textarea>
            <!--           <span class="right-bottom-corner-tip">280字</span>-->
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_founder_des" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--    回报说明-->
    <div id="hide_proj_repay_explain" class="page-input-cont hide">
        <div class="page-input-box">
            <textarea id="hide_proj_repay_explain_value" name="abc" class="page-input-box-cont" rows="6" placeholder='回报说明'></textarea>
            <!--           <span class="right-bottom-corner-tip">150字</span>-->
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_repay_explain" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--    身份证图片地址-->
    <input class="hide" type="text" id="id_card" placeholder='身份验证信息图片' />

    <!--    微信二维码图片地址-->
    <input class="hide" type="text" id="wechat_dimen" placeholder='微信二维码图片' />


    <!--    注意事项-->
    <div id="hide_proj_warning" class="page-input-cont hide">
        <div class="page-input-box">
            <textarea id="hide_proj_warning_value" name="abc" class="page-input-box-cont" rows="6" placeholder='注意事项'></textarea>
            <!--           <span class="right-bottom-corner-tip">150字</span>-->
        </div>
        <div class="page-input-button">
            <a data-open-input="close" data-mapping-id="hide_proj_warning" href="javascript:void(0)" class="input-button">完成</a>
        </div>
    </div>

    <!--jquery的js文件-->
    <script type="text/javascript" src="/public/lib/jquery/jquery.min.js"></script>

    <!--    bootstrap基础文件引入-->
    <script type="text/javascript" src="/public/lib/bootstrap/bootstrap.min.js"></script>
    <!--    警告提示框的js源文件-->
    <script type="text/javascript" src="/public/lib/messenger/js/messenger.min.js"></script>
    <!--    警告提示的js文件-->
    <script type="text/javascript" src="/public/js/util/imessenger.js"></script>
   	<!-- ajax上传文件的js包 -->
    <script type="text/javascript" src="/public/lib/file/ajaxfileupload.js"></script>
    
    <!--    用于验证的js文件-->
    <script type="text/javascript" src="/public/js/util/verify.js"></script>
    
    <!--    引入测试的js文件,此文件仅在开发过程中使用,真实上线时需要删除-->
    <script type='text/javascript' src="/public/js/create.js"></script>
</body>
</html>
