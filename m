Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:34876 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031414Ab3HIW5i (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 18:57:38 -0400
Date: Sat, 10 Aug 2013 00:57:36 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: 32bit allyesconfig on 64bit system broke
Message-ID: <20130809225736.GG19750@two.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


% linux32 make allyesconfig
% head .config
% head .config
#
# Automatically generated file; DO NOT EDIT.
# Linux/x86 3.11.0-rc4 Kernel Configuration
#
CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y

This used to work to give me a 32bit allyesconfig.
How am I supposed to do this now?

Thanks,

-Andi
