function getLodop(oOBJECT, oEMBED) {
    /**************************
      ������������������;��������ĸ�������Ϊ�ؼ�ʵ����
      IEϵ�С�IE�ں�ϵ�е����������oOBJECT��
      ���������(Firefoxϵ�С�Chromeϵ�С�Operaϵ�С�Safariϵ�е�)����oEMBED,
      ����64λ�����ָ��64λ�İ�װ����install_lodop64.exe��
    **************************/
    var strHtmInstall = "<div class='printTip'>��ӡ�ؼ�δ��װ���������<a href='../Scripts/install_lodop32.exe'>ִ�а�װ</a>����װ����ˢ��ҳ������½��롣</div>";
    var strHtmUpdate = "<div class='printTip'>��ӡ�ؼ���Ҫ�������������<a href='../Scripts/install_lodop32.exe'>ִ������</a>�������������½��롣</div>";
    var strHtm64_Install = "<div class='printTip'>��ӡ�ؼ�δ��װ���������<a href='../Scripts/install_lodop64.exe'>ִ�а�װ</a>����װ����ˢ��ҳ������½��롣</div>";
    var strHtm64_Update = "<div class='printTip'>��ӡ�ؼ���Ҫ�������������<a href='../Scripts/install_lodop64.exe'>ִ������</a>�������������½��롣</div>";
    var strHtmFireFox = "<div class='printTip'>ע�⣺1��������װ��Lodop�ɰ渽��npActiveXPLugin�����ڡ����ߡ�->�����������->����չ������ж����</div>";
    var LODOP = oEMBED;
    try {
        if (navigator.appVersion.indexOf("MSIE") >= 0)
            LODOP = oOBJECT;
        if ((LODOP == null) || (typeof (LODOP.VERSION) == "undefined")) {
            if (navigator.userAgent.indexOf('Firefox') >= 0)
                $("body").append(strHtmInstall);
                //document.write(strHtmFireFox);
                //document.documentElement.innerHTML=strHtmFireFox+document.documentElement.innerHTML;
            if (navigator.userAgent.indexOf('Win64') >= 0) {
                $("body").append(strHtm64_Install);
                //document.write(strHtm64_Install);
                //if (navigator.appVersion.indexOf("MSIE") >= 0) document.write(strHtm64_Install); else
                //    document.documentElement.innerHTML = strHtm64_Install + document.documentElement.innerHTML;
            } else {
                $("body").append(strHtmInstall);
                //document.write(strHtmInstall);
                //if (navigator.appVersion.indexOf("MSIE") >= 0) document.write(strHtmInstall); else 
                //document.documentElement.innerHTML = strHtmInstall + document.documentElement.innerHTML;
            }
            return LODOP;
        } else if (LODOP.VERSION < "6.1.1.8") {
            if (navigator.userAgent.indexOf('Win64') >= 0) {
                $("body").append(strHtm64_Update);
                //document.write(strHtm64_Update);
                //if (navigator.appVersion.indexOf("MSIE") >= 0) document.write(strHtm64_Update); else
                //    document.documentElement.innerHTML = strHtm64_Update + document.documentElement.innerHTML;
            } else {
                $("body").append(strHtmUpdate);
                //document.write(strHtmUpdate);
                //if (navigator.appVersion.indexOf("MSIE") >= 0) document.write(strHtmUpdate); else
                //    document.documentElement.innerHTML = strHtmUpdate + document.documentElement.innerHTML;
            }
            return LODOP;
        }
        //*****���¿հ�λ���ʺϵ���ͳһ����:*********	     
        //LODOP.SET_LICENSES("","692989995110115981151055612460","","");

        //*******************************************
        return LODOP;
    } catch (err) {
        if (navigator.userAgent.indexOf('Win64') >= 0)
            $("body").append(strHtm64_Install);
            //document.write(strHtm64_Install);
            //document.documentElement.innerHTML = "Error:" + strHtm64_Install + document.documentElement.innerHTML;
        else
            $("body").append(strHtmInstall);
            //document.write(strHtmInstall);
            //document.documentElement.innerHTML = "Error:" + strHtmInstall + document.documentElement.innerHTML;
        return LODOP;
    }
}

