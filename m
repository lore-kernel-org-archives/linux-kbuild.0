Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45650 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751687AbbKPOeK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Nov 2015 09:34:10 -0500
Subject: Re: git repo (newbie)
References: <CAGXs5wXfdfOVKvkdnONV7TGUv-e+w+kpJt3+XH8-kAo-yEo85w@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <5649E960.10003@suse.cz>
Date: Mon, 16 Nov 2015 15:34:08 +0100
MIME-Version: 1.0
In-Reply-To: <CAGXs5wXfdfOVKvkdnONV7TGUv-e+w+kpJt3+XH8-kAo-yEo85w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kevin Wilson <wkevils@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Dne 16.11.2015 v 13:28 Kevin Wilson napsal(a):
> Hi all,
> Against which git kernel repo (URL) are the patches sent to this
> mailing list are done ?

The kbuild patches are collected in
git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git, as you
can see in the MAINTAINERS file in the kernel tree. But people typically
base their patches on some tag of Linus's tree, so that anybody can
easily test them. The exception are of course patches to fix bugs in
other kbuild patches.

Michal
