Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueueb.post.tele.dk ([193.162.153.10]:37580 "EHLO
	pqueueb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932210Ab0D3Q4G (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Apr 2010 12:56:06 -0400
Received: from pfepa.post.tele.dk (pfepa.post.tele.dk [195.41.46.235])
	by pqueueb.post.tele.dk (Postfix) with ESMTP id 83E55843F
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Apr 2010 20:07:02 +0200 (CEST)
Date: Thu, 29 Apr 2010 20:06:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [kbuild-devel] Dynamically add objects to be built
Message-ID: <20100429180635.GA26336@merkur.ravnborg.org>
References: <z2za730395e1004290938v7394bf9nc28fed6333396335@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z2za730395e1004290938v7394bf9nc28fed6333396335@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris Horlick <chorlick@gmail.com>
Cc: kbuild-devel@lists.sourceforge.net, linux-kbuild@vger.kernel.org

First - posting to linux-kbuild will liekly get you more attention.
The old list at sourceforge is no longer active.

[From the bottom of your mail]
> If anyone can point me to the "kbuild" way of doing things, it would be
> greatly appreciated. Thanks!
The kbuild philosofy is that you specify all .o files.
Considering the many many hours invested writing a single .c file,
then the effort it is to add it to the kbuild file is minimal.

On Thu, Apr 29, 2010 at 11:38:30AM -0500, Chris Horlick wrote:
> Im having an issue getting my build system set up the way id like and im
> hoping someone here can point me in a new direction or perhaps offer some
> advice.
> If i manually add each .o file i want built to the makefile the lkm will
> build with no issues, essentially this works:
> 
> OBJS = main.o
> #OBJS += wm_algo_common.o
> #OBJS += wm_algomgr_ops.o
> #OBJS += wm_algomgr_static.o
> #OBJS += wm_algo_tcp1.o
> #OBJS += wm_algo_tcp2.o
> #OBJS += wm_algo_udp.o
> #OBJS += wm_arp_reg_method.o
> #OBJS += wmc_algomgr.o
> #OBJS += wmc_core.o
> #OBJS += wmc_core_function.o
> #OBJS += wmc_debug.o
> #OBJS += wmc_linked_list.o
> #OBJS += wm_core_info.o
> #OBJS += wm_core_ops.o
> #OBJS += wmc_packet_common.o
> #OBJS += wmc_regmgr.o wm_driver.o
> #OBJS += wm_hashtable.o
> #OBJS += wm_network_common.o
> #OBJS += wm_regmgr_ops.o
> #OBJS += wm_regmgr_static.o
> 
> Granted these are commented out but they will build a loadable lkm if i
> un-comment the obj lines. What i would really like is just to be able to
> drop new sources into my build directory and have the makefile pick them up
> and build them auto-magically, something like this:
> 
> OBJS = $(patsubst %.c,%.o,$(wildcard $(PWD)/*.c))

What you fail to realise is that current directory is the root
of the kernel source when you build your module.

Try something like this:

OBJS := $(patsubst %.c, %.o,$(notdir $(wildcard $(src)/*.c)))

$(wildcard $(src)/*.c) will find all .c files in the directory where you module reside
$(notdir ...) remove the path component.

Try to look at the resulting OBJS like this:

$(warning OBJS=$(OBJS))

Note - I used ":=" above. I always avoid using "=" unless strictly required.

	Sam
