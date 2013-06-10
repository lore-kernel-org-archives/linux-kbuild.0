Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:60714 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038Ab3FJNPs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Jun 2013 09:15:48 -0400
Received: by mail-wi0-f180.google.com with SMTP id c10so1382880wiw.13
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jun 2013 06:15:47 -0700 (PDT)
Message-ID: <51B5D180.5080509@gmail.com>
Date: Mon, 10 Jun 2013 15:15:44 +0200
From: Gabriel de Perthuis <g2p.code@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Don't run find across mountpoints
References: <51B4A9D1.7070502@gmail.com> <51B5CFAC.6050704@suse.cz>
In-Reply-To: <51B5CFAC.6050704@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Le lun. 10 juin 2013 15:07:56 CEST, Michal Marek a écrit :
> What kind of mountpoint zoo do you maintain in your build tree? :) We
> run a find in make clean, make mrproper and other targets. So you might
> need to fix more places. But please explain your use case.
>
> Michal

I happened to be running a fuse thing (git fs, mounted under .git/fs);
recursing that can take a *long* time.

`find .` is the only one that actually runs into trouble, although it
might be good if -xdev could be the default (through a shell
function maybe?).
