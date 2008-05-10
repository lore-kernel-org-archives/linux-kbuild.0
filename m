Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from barikada.upol.cz ([158.194.242.200]:58053 "EHLO
	barikada.upol.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753291AbYEJV3f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 May 2008 17:29:35 -0400
Received: from flower (flower.upol.cz [158.194.64.22])
	by barikada.upol.cz (Spam Firewall) with ESMTP id 61578225460
	for <linux-kbuild@vger.kernel.org>; Sat, 10 May 2008 23:29:12 +0200 (CEST)
Received: from flower (flower.upol.cz [158.194.64.22]) by barikada.upol.cz with ESMTP id f0HQ2wYBSYAXlEDq for <linux-kbuild@vger.kernel.org>; Sat, 10 May 2008 23:29:12 +0200 (CEST)
Received: from olecom by flower with local (Exim 4.63)
	(envelope-from <olecom@flower.upol.cz>)
	id 1Juwxo-0005iC-4D
	for linux-kbuild@vger.kernel.org; Sat, 10 May 2008 23:50:44 +0200
Subject: Re: [PATCH] kconfig: add support for K=file
In-Reply-To: <20080510211007.GA32242@uranus.ravnborg.org>
References: <20080502204729.GA6534@uranus.ravnborg.org> <1209761358-6579-1-git-send-email-sam@ravnborg.org> <E1JuwZh-0004Yv-CP@flower> <20080510211007.GA32242@uranus.ravnborg.org>
Date: Sat, 10 May 2008 23:50:44 +0200
Message-Id: <E1Juwxo-0005iC-4D@flower>
From: Oleg Verych <olecom@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild list <linux-kbuild@vger.kernel.org>

Sam Ravnborg @ Sat, 10 May 2008 23:10:07 +0200

> I killed that shell script in a later patch and now
> aconf recognize the named option.

Well, good example of wasting time without any kind of patch-tracking
system. At least git-mail-notification in the thread about reverts of
whole patches and drops of particular files/changes (per patch basis)...

Or maybe just to start using `git` (with all that traffic fun)?
____
