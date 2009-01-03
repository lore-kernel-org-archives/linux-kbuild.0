Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.188]:55039 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753013AbZACKy5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2009 05:54:57 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [1/3] KBUILD: Add script to manipulate .config files on the command line
Date: Sat, 3 Jan 2009 11:54:44 +0100
References: <20090103321.351399938@firstfloor.org>
In-Reply-To: <20090103321.351399938@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200901031154.44868.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org

On Saturday 03 January 2009, Andi Kleen wrote:
> 
> I often change single options in .config files. Instead of using
> an editor or one of the frontends it's convenient to do this from
> the command line. It's also useful to do from automated build scripts
> when building different variants from a base config file.
> 
> I extracted most of the CONFIG manipulation code from one of my
> build scripts into a new shell script scripts/config

This looks very useful, thanks for sharing.

> The script is not integrated with the normal Kconfig machinery
> and doesn't do any checking against Kconfig files, but just manipulates
> that text format. This is always done at make time anyways.

Why? I would imagine it to be useful to get immediate feedback
whether changing the option was successful. It should be easy to
run scripts/kconfig/conf -o on the config file afterwards.

My normal workflow when changing single options is to remove the
line from .config and call make oldconfig again. What I would
like to see most here is something like

./scripts/config --reconfigure smp
Remove SMP from .config, and do oldconfig to ask again.

	Arnd <><
