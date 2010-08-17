Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:33122 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1757712Ab0HQQAy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 12:00:54 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2010 09:00:45 -0700
Date: Tue, 17 Aug 2010 09:00:44 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: bug LINUX_VERSION_CODE undefined
Message-Id: <20100817090044.d4026453.rdunlap@xenotime.net>
In-Reply-To: <AANLkTimC=VDH=m9SoDK3BGzk7eCKRj6dEVzU230_kFPH@mail.gmail.com>
References: <AANLkTik2VDPSZvMzQ8rv38jBDKmRaM9-TL9nhqxj_VSQ@mail.gmail.com>
	<AANLkTimC=VDH=m9SoDK3BGzk7eCKRj6dEVzU230_kFPH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sergey Naumov <sknaumov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, 17 Aug 2010 13:29:38 +0400 Sergey Naumov wrote:

> Hello. This is my first message to this list so please be patient.
> 
> I have encountered compilation error due to
> #define LINUX_VERSION_CODE
> in include/linux/version.h
> 
> This happens because $(VERSION) variable in the main Makefile has a
> value of 2.6.35.2 instead of 2,
> so "expr" utility fails to generate LINUX_VERSION_CODE value with an
> error "non-numeric argument" or smth.

AFAIK, it usually happens due to some shell not liking some syntax in the Makefile.
What shell are you using?


> I have found only one link (
> http://www.spinics.net/lists/linux-kbuild/msg03230.html ) to this
> issue in the Internet,
> but there is no response to it, so I decided to post this message.

There are replies in the bugzilla entry, including a possible fix.
  https://bugzilla.kernel.org/show_bug.cgi?id=16510


> Please subscribe me personally to answers to this post.

Michal, did you do anything with your suggested fix?

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
