Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f184.google.com ([209.85.210.184]:51009 "EHLO
	mail-yx0-f184.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933617AbZGPXmf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Jul 2009 19:42:35 -0400
MIME-Version: 1.0
In-Reply-To: <20090716201601.GA6038@merkur.ravnborg.org>
References: <200907162041.53181.elendil@planet.nl> <20090716201601.GA6038@merkur.ravnborg.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 17 Jul 2009 09:42:15 +1000
Message-ID: <646765f40907161642u4d7bb2fo1e4d3a682acf7958@mail.gmail.com>
Subject: Re: [PATCH,resend] sparc64: build compressed image (zImage) by
	default
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>, sparclinux@vger.kernel.org, linux-kbuild@vger.kernel.org, Jurij Smakov <jurij@wooyd.org>, David Miller <davem@davemloft.net>

On Fri, Jul 17, 2009 at 06:16, Sam Ravnborg<sam@ravnborg.org> wrote:
> Hmmm..
> This path does the following:
> 1) zImage becomes default for sparc and sparc64
> 2) fixes zImage on sparc64 (it dod not work before)
> 3) On sparc zImage is a stripped version of vmlinux, on sparc64 it is a gzipped not-stripped
>   version of vmlinux - so it introduces a significantly different zImage.
>
> Could we agree on the _same_ format for zImage on sparc and sparc64 and then apply that patch?
>
> I know Julian is working on unifying piggyback_{32,64}.c so maybe that is
> covered by his work?

I have been fiddling with that, but time is been at a premium at the moment.

I don't believe that changes to the zImage / vmlinux targets will
affect this as the tftpboot code uses the uncompressed (I believe)
"Image" target.

Thanks,

-- 

Julian Calaby

Email: julian.calaby@gmail.com
.Plan: http://sites.google.com/site/juliancalaby/
