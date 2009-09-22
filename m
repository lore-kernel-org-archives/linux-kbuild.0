Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:55407 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756528AbZIVNJq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2009 09:09:46 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] warn about use of uninstalled kernel headers
Date: Tue, 22 Sep 2009 15:09:47 +0200
References: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com> <200909211637.12983.arnd@arndb.de> <20090922044310.GA29208@merkur.ravnborg.org>
In-Reply-To: <20090922044310.GA29208@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200909221509.47369.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Am?rico Wang <xiyou.wangcong@gmail.com>, Caveh Jalali <ecaveh@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 22 September 2009, Sam Ravnborg wrote:
> > +#ifndef __EXPORTED_HEADERS__
> But why do we need this "__EXPORTED_HEADERS__" thing?
> 
> ?

The problem is that the warning should only be for headers
that are not installed yet, but it needs to be stripped
in the installed version. Since we're already postprocessing
all files with unifdef, that seemed like the easiest way 
to strip out the #warning. Obviously, I couldn't use the
#ifdef __KERNEL__ logic, because that would either warn
give false positives when building kernel code or when
building user code from installed headers.

	Arnd <><
