Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41099 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757552Ab1IAOXO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Sep 2011 10:23:14 -0400
Message-ID: <4E5F9551.6090909@suse.cz>
Date: Thu, 01 Sep 2011 16:23:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: protect locale-unsafe calls
References: <1313471973-13966-1-git-send-email-lacombar@gmail.com> <4E5E26B8.5030606@suse.cz>
In-Reply-To: <4E5E26B8.5030606@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, s.koylux@gmail.com

On 31.8.2011 14:19, Michal Marek wrote:
> As for the tollower/toupper issue, I would propose a much simpler way:
> Let's not try to be cute and simply use include/config/FOO_BAR.h for
> each CONFIG_FOO_BAR. x86_64 allmodconfig results in some 5k symbols
> enabled, I'm sure any filesystem will handle a directory with 5k files
> in it.

Unfortunately, we can't do this, because updating from a tree that used
include/config/foo/bar.h would result in missed rebuilds :-(.

Michal
