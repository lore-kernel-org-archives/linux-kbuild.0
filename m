Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.154]:14073 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682AbZHUWOF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 18:14:05 -0400
Received: by fg-out-1718.google.com with SMTP id e12so259205fga.17
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2009 15:14:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090821215106.GD16210@merkur.ravnborg.org>
References: <4cb7f2290908211345t2569f213s87284b9fce6e6c17@mail.gmail.com>
	 <20090821215106.GD16210@merkur.ravnborg.org>
Date: Sat, 22 Aug 2009 00:14:05 +0200
Message-ID: <4cb7f2290908211514s63bfbfd8vb2d5f808ce4f3345@mail.gmail.com>
Subject: Re: [kbuild-devel] Problem with KBUILD_MODNAME
From: Nipun sehrawat <nipunsehrawatns@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild-devel@lists.sourceforge.net, Dan Mihai Dumitriu <dan.mihai.dumitriu@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Sam,

On Fri, Aug 21, 2009 at 11:51 PM, Sam Ravnborg<sam@ravnborg.org> wrote:
> kbuild list on sourceforge is long defunct.
> Please use linux-kbuild@vger.kernel.org.
>
>
> On Fri, Aug 21, 2009 at 10:45:14PM +0200, Nipun sehrawat wrote:
>> Hi List,
>>
>> I am porting KTCPVS (last released for 2.6.18) to the latest kernel. I
>> was able to compile most of the files on 2.6.30, until I got struck at
>> a strange "KBUILD_MODNAME undefined warning" The Makefile of KTCPVS is
>> :
>>
>> ---------------------------------Makefile
>> Starts-------------------------------------
>> # ktcpvs migrate to 2.6
>>
>> ifneq ($(KERNELRELEASE),)
>>     ifdef CONFIG_MODVERSIONS
>>     EXTRA_CFLAGS := -DCONFIG_TCP_VS_DEBUG
>>     endif
>>     obj-m := ktcpvs.o tvs_hhttp.o tvs_phttp.o tvs_chttp.o tvs_http.o tvs_wlc.o
>>     LIBS := tcp_vs_sched.o tcp_vs_ctl.o misc.o redirect.o
>> tcp_vs_srvconn.o tcp_vs_timer.o tcp_vs.o fault.o regex/regcomp.o
>>     LIBS += regex/kernel.o regex/regfree.o
>>     ktcpvs-y := $(LIBS)
>
> If you are building a module use "-m" not "-y".
> Try that and see if it hepls you.

According to Kbuild Documentation in Linux Kernel source :

"Kbuild needs to know which the parts that you want to build your
module from, so you have to tell it by setting an
$(<module_name>-objs) variable."

I tried changing ktcpvs-y to ktcpvs-objs, but it didn't help.

>
>        Sam
>

Thanks for your quick response!

Cheers,
Nipun
