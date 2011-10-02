Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dd26914.kasserver.com ([85.13.145.202]:46697 "EHLO
	dd26914.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096Ab1JBK4o (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 2 Oct 2011 06:56:44 -0400
Received: from [192.168.178.20] (pD951936B.dip0.t-ipconnect.de [217.81.147.107])
	by dd26914.kasserver.com (Postfix) with ESMTPSA id 99CE22760052
	for <linux-kbuild@vger.kernel.org>; Sun,  2 Oct 2011 12:56:42 +0200 (CEST)
Message-ID: <4E88436E.3070309@Kriegisch.name>
Date: Sun, 02 Oct 2011 12:56:46 +0200
From: Alexander Kriegisch <Alexander@Kriegisch.name>
MIME-Version: 1.0
Subject: Re: kbuild/kconfig for non-Linux projects
References: <4E882F41.6070603@Kriegisch.name>
In-Reply-To: <4E882F41.6070603@Kriegisch.name>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Okay, another developer in our project found the place where to 
configure this (Arnaud, please correct us if this is wrong):


--- scripts/kconfig/lkc.h
+++ scripts/kconfig/lkc.h
@@ -42,7 +42,7 @@
  #define N_(text) (text)

  #ifndef CONFIG_
-#define CONFIG_ "CONFIG_"
+#define CONFIG_ ""
  #endif

  #define TF_COMMAND	0x0001


Just in case anyone else wonders how to do this...
--
Alexander Kriegisch


Alexander Kriegisch, 02.10.2011 11:30:
> I am new to this list, but trying to reply to an older thread,
> re-using its title/subject. I am going to quote Arnaud's message
> because my question relates to it.
>
> @Arnaud: I have successfully downloaded, installed and built a
> tarball from your 2.6.39 branch. So far, so good. What I am trying to
> do, though, is to refresh an older kbuild version, taken from
> Buildroot some about years ago. It works nicely and I especially like
> the warnings for cyclic references and missing direct dependencies.
>
> There is one issue we are facing in our open source project
> (http://freetz.org), though: Our previous kconfig version used
> symbols which were identical in .config with the names in Config.in,
> i.e. they had no "CONFIG_" prefixes. Now kconfig writes .config files
> with those prefixes, so in order not to break our build system we had
> to add scripts replacing names back and forth before we start
> conf/mconf and after they terminate.
>
> Question: Is there a straightforward way to make kconfig read/write
> symbols*without*  "CONFIG_" prefixes? As I am not a C programmer,
> would you mind providing a patch if necessary?
>
>
>> using kconfig outside the linux kernel tree should be trivial,
>> normally, as you said, all the Linux "branding" should have been
>> made configurable. The trick might be to have the correct Makefile
>> glue to let it build. If you want some of the work pre-done, I just
>> pushed an old repository of mine on github. It should contains only
>> what's needed to build the various part of kconfig:
>>
>> https://github.com/lacombar/kconfig/
>>
>> I did not really touch it since October 2010, so it is certainly
>> missing parts (especially bug fixes). Moreover, it squashes commit
>> to keep the history clean, but I tried to keep the shortlog to have
>> an idea what has been going on. Last warning, I do not guarantee
>> the tree integrity (ie. I love rebasing :))
