Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:63755 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751384AbaCRFLQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Mar 2014 01:11:16 -0400
Date: Tue, 18 Mar 2014 14:11:07 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] kbuild: docbook: use $(obj) and $(src) rather than specific path
In-Reply-To: <532336AB.4070509@suse.cz>
References: <1390194659-15155-1-git-send-email-yamada.m@jp.panasonic.com> <532336AB.4070509@suse.cz>
Message-Id: <20140318141107.3B4A.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi Michal,


> > -include $(srctree)/Documentation/DocBook/media/Makefile
> > +include $(srctree)/$(src)/media/Makefile
> 
> You can drop the $(srctree) here, make will find the file in the VPATH.
> 
> Michal

OK. I will post v2.

Best Regards
Masahiro yamada

