Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33655 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754165AbbFAX6q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jun 2015 19:58:46 -0400
MIME-Version: 1.0
Date: Tue, 2 Jun 2015 01:58:46 +0200
Message-ID: <CAEMqcmpHhHdB3Bx-ktfA2F1ni9BPa1jEZ9HLe4eHZu7_L+gyiA@mail.gmail.com>
Subject: Kconfiglib -- a flexible Kconfig parser -- now on GitHub
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello,

A few years ago I posted patches for a Python Kconfig parser and
library I was working on (https://lkml.org/lkml/2011/2/6/151). As not
many people are probably aware of it, an updated version of that
library has been at https://github.com/ulfalizer/Kconfiglib for a
while now, and is being used for some tasks in e.g. Buildroot and Das
U-Boot.

As a concrete example, I just noticed scripts/checkkconfigsymbols.py
and remembered that I have an example script that does the same thing
(minus some functionality):
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/print_undefined.py.

I have no intention to get Kconfiglib into the kernel (unless there
would be a demand), and it's definitely not meant to replace the C
implementation or introduce a Python dependency for standard builds.
It's just an auxiliary helper library which some people might find
useful -- especially when doing "unusual" things with Kconfig-based
configuration systems.

Cheers,
Ulf
