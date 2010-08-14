Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44064 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757105Ab0HNWlK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Aug 2010 18:41:10 -0400
Message-ID: <4C671B84.1090801@suse.cz>
Date: Sun, 15 Aug 2010 00:41:08 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix savedefconfig with choice marked optional
References: <20100814212900.GA29962@merkur.ravnborg.org>
In-Reply-To: <20100814212900.GA29962@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Dne 14.8.2010 23:29, Sam Ravnborg napsal(a):
> From db5b47421d4e9c2f3a35bc3aaa4a1423b767e00a Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Sat, 14 Aug 2010 23:22:16 +0200
> Subject: [PATCH] kconfig: fix savedefconfig with choice marked optional
> 
> savedefconfig failed to save the correct minimal config
> when it encountered a choice marked optional.
> 
> Consider following minimal configuration:
> $cat Kconfig
> choice
> 	prompt "choice"
> 	optional
> 
> config A
> 	bool "a"
> 
> config B
> 	bool "b"
> 
> endchoice
> 
> $cat .config | grep -v ^#
> CONFIG_A=y
> 
> $conf --savedefconfig=defconfig Kconfig
> 
> would before this fix result in an empty file, because
> kconfig would assume that CONFIG_A=y is a default value.
> But because the choice is optional the default is that
> both A and B are =n.
> 
> Fix so we handle optional choices correct.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  scripts/kconfig/confdata.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Applied to kbuild/kconfg.

Michal
