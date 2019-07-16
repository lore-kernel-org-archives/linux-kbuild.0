Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f44.google.com ([209.85.221.44]:34845 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfGPOkj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 10:40:39 -0400
Date: Tue, 16 Jul 2019 16:40:34 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716144034.GA36330@gmail.com>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> The gold linker has known issues of failing the build in random and
> predictible ways. H.J. stated:

s/predictable/unpredictable?

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
