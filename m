Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0708.google.com ([209.85.198.247]:33453 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1761556AbYEAVw0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 17:52:26 -0400
Received: by rv-out-0506.google.com with SMTP id k29so665278rvb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2008 14:52:25 -0700 (PDT)
Message-ID: <8499950a0805011452v7e38125ew7bdc37fe60ecebb5@mail.gmail.com>
Date: Thu, 1 May 2008 22:52:25 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: `sed`ing asm-offsets (Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas)
In-Reply-To: <20080501214219.GA8386@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net>
	 <20080501120616.GY29330@cs181133002.pp.htv.fi>
	 <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net>
	 <20080501163453.GF29330@cs181133002.pp.htv.fi>
	 <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
	 <20080501165333.GG29330@cs181133002.pp.htv.fi>
	 <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net>
	 <20080501185352.GU24008@flower.upol.cz>
	 <20080501214219.GA8386@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: sampo@symlabs.com, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org

Sam Ravnborg @ Thu, May 1, 2008 at 10:42 PM:
>  > > >   sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /*
>  > > > \3 */:; s:->::; p;}" < asm-offsets.s
>  > > >
>  >
>  > Here is side-problem with this script, which manifests itself as so:
>  ...
>  Can you come up with a _minimal_ fix that makes it compatible with
>  busy-box AND GNU sed?

Script works in GNU and busybox sed, except that "$#" thing.
Let's wait for `set -x` feedback.
_____
