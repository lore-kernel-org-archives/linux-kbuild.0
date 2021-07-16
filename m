Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_20,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51646C12002
	for <linux-kbuild@archiver.kernel.org>; Fri, 16 Jul 2021 23:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BEB8613EE
	for <linux-kbuild@archiver.kernel.org>; Fri, 16 Jul 2021 23:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhGPXG5 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 16 Jul 2021 19:06:57 -0400
Received: from mailproxy02.manitu.net ([217.11.48.66]:38048 "EHLO
        mailproxy02.manitu.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhGPXG5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jul 2021 19:06:57 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Jul 2021 19:06:57 EDT
Received: from [192.168.1.126] (mue-88-130-54-021.dsl.tropolys.de [88.130.54.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: chris@argonautx.net)
        by mailproxy02.manitu.net (Postfix) with ESMTPSA id 76985C004C
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Jul 2021 00:58:03 +0200 (CEST)
To:     linux-kbuild@vger.kernel.org
From:   Christian Stalp <chris@argonautx.net>
Subject: Building a Linux kernel with make deb-pkg and own modifications
Message-ID: <9c2db199-a90e-2d02-1d40-94ff3e0553f7@argonautx.net>
Date:   Sat, 17 Jul 2021 00:58:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello out there, Im struggling at the moment with the attempt to build a
Debian kernel with some small changes I made. I got my kernel from
kernel.org untared it, used the old config for "make oldconfig". Then I
used make -j3 deb-pkg LOCALVERSION=-debian KDEB_PKGVERSION=$(make
kernelversion)-1. This worked and produced the working kernel as Debian
package (as well as some other packages ...)
But after I made some small changes within the kernel sourcecode, and
tried to rebuild the kernel, I got the error: dpkg-source: error:
unrepresentative changes to source.
I also removed the older packages from the upper directory, which was
suggested by some sites, same result.

How can I make some changes within the kernel and build a Debian kernal
package?

Thank you in advance

BR Chris
