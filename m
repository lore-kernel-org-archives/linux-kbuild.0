Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:52978 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753037Ab1AQMK5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Jan 2011 07:10:57 -0500
Message-ID: <4D3431CF.5070407@suse.cz>
Date: Mon, 17 Jan 2011 13:10:55 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Where is the end of "menuconfig" entry scope?
References: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com>
In-Reply-To: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Filip Honckiewicz <f.honckiewicz@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 15.1.2011 22:35, Filip Honckiewicz wrote:
> I just want to ask you - Great Developers - where is the end of
> "menuconfig" entry scope? I read kconfig-language.txt, but there are
> some lacks in documentation, so I don't know which (and why?)
> suboption is the last suboption of menuconfig. Is this defined by end
> of Kconfig file or what?

"menuconfig" does not start a block, semantically it is equivalent to
"config". Kconfig is able to derive the menu structure from
dependencies, see "Menu structure" in kconfig-language.txt,
config/menuconfig only influence how the resulting menu is rendered in
the frontends. E.g. 'make nconfig' and 'make menuconfig' frontends
display the menu like

[*] Foo
[ ]   Bar
[ ]   Baz

if Foo is "config", and

[*] Foo  --->
(Bar and Baz hidden in the submenu)

if Foo is "menuconfig".

hth,
Michal
