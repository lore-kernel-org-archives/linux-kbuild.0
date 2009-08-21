Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:54202 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932243AbZHUVvP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 17:51:15 -0400
Date: Fri, 21 Aug 2009 23:51:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [kbuild-devel] Problem with KBUILD_MODNAME
Message-ID: <20090821215106.GD16210@merkur.ravnborg.org>
References: <4cb7f2290908211345t2569f213s87284b9fce6e6c17@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cb7f2290908211345t2569f213s87284b9fce6e6c17@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nipun sehrawat <nipunsehrawatns@gmail.com>
Cc: kbuild-devel@lists.sourceforge.net, Dan Mihai Dumitriu <dan.mihai.dumitriu@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

kbuild list on sourceforge is long defunct.
Please use linux-kbuild@vger.kernel.org.


On Fri, Aug 21, 2009 at 10:45:14PM +0200, Nipun sehrawat wrote:
> Hi List,
> 
> I am porting KTCPVS (last released for 2.6.18) to the latest kernel. I
> was able to compile most of the files on 2.6.30, until I got struck at
> a strange "KBUILD_MODNAME undefined warning" The Makefile of KTCPVS is
> :
> 
> ---------------------------------Makefile
> Starts-------------------------------------
> # ktcpvs migrate to 2.6
> 
> ifneq ($(KERNELRELEASE),)
>     ifdef CONFIG_MODVERSIONS
>     EXTRA_CFLAGS := -DCONFIG_TCP_VS_DEBUG
>     endif
>     obj-m := ktcpvs.o tvs_hhttp.o tvs_phttp.o tvs_chttp.o tvs_http.o tvs_wlc.o
>     LIBS := tcp_vs_sched.o tcp_vs_ctl.o misc.o redirect.o
> tcp_vs_srvconn.o tcp_vs_timer.o tcp_vs.o fault.o regex/regcomp.o
>     LIBS += regex/kernel.o regex/regfree.o
>     ktcpvs-y := $(LIBS)

If you are building a module use "-m" not "-y".
Try that and see if it hepls you.

	Sam
