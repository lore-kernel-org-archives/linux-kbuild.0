Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gv-out-0910.google.com ([216.239.58.190]:28822 "EHLO
	gv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762103AbZJONYw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2009 09:24:52 -0400
Received: by gv-out-0910.google.com with SMTP id r4so86084gve.37
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2009 06:23:04 -0700 (PDT)
Date: Thu, 15 Oct 2009 08:31:39 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH v2 0/2] fakeroot dwimery for scripts/package/*
Message-ID: <20091015133139.GA6718@progeny.tock>
References: <20091014064622.GA8711@progeny.tock>
 <20091014071627.GA6256@merkur.ravnborg.org>
 <200910141159.03799.elendil@planet.nl>
 <20091014110331.GZ28231@baikonur.stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20091014110331.GZ28231@baikonur.stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Frans Pop <elendil@planet.nl>

maximilian attems wrote:
> Frans Pop wrote:
>> Sam Ravnborg wrote:

>>> That could be the longer:
>>>
>>>    KBUILD_PKG_ROOTCMD
>>>
>>> Which with the KBUILD_ prefix could be a globel environment
>>> variable for some.
>>
>> I have not tested it, but the patches look good otherwise, so with Sam's 
>> suggested change:
>> Acked-by: Frans Pop <elendil@planet.nl>
>
> Acked-by: maximilian attems <max@stro.at>
>
> I also agree that this should land in -next as feature patch.
> btw thanks for kicking that item of my TODO :)

Thanks, all.  Here’s an updated version, tested with a new build last
night.  This is indeed intended for -next.

Jonathan Nieder (2):
  scripts/package: add KBUILD_PKG_ROOTCMD variable
  scripts/package: use fakeroot if available

 scripts/package/Makefile |   25 +++++++++++++++++++------
 1 files changed, 19 insertions(+), 6 deletions(-)

