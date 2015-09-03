Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:46577 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751386AbbICKki (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Sep 2015 06:40:38 -0400
From: Jonas Gorski <jogo@openwrt.org>
Subject: invisible choices in kconfig
Message-ID: <55E823A4.3020802@openwrt.org>
Date: Thu, 3 Sep 2015 12:40:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hi,

I'm trying to add* an "conditionally invisible choice" to kconfig, but
it seems like visibility is treated like a dependency in contrast to
"normal" prompt-less or invisible menu options.

Is this intentional?

A simplified version of what I'm trying to have is

config FOO
	bool "Foo"

choice
	prompt "Baz" if FOO
	default BAZ_A

	config BAZ_A
		bool "Baz A"

        config BAZ_B
                bool "Baz B"

endchoice

But unless FOO is set, neither BAZ_A nor BAZ_B will appear in .config or
will be set.

The obvious workaround is to define a duplicate set of hidden BAZ config
values that will get selected by the BAZ choice values. But then they
also need to copy the defaults from the choice and this gets dirty really
fast and easily out of sync, in addition of introducing twice as many
config symbols.

Regards
Jonas

* actually I already added one in the expectation that it works that way.
The default non prompt value isn't checked anywhere, only the non-default
options are, so it "worked" as expected, so I didn't noticed it was
broken.
