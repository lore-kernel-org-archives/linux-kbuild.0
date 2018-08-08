Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:39048 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbeHHTko (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Aug 2018 15:40:44 -0400
Received: by mail-io0-f195.google.com with SMTP id o22-v6so2455051ioh.6
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Aug 2018 10:20:06 -0700 (PDT)
Subject: Re: [RESEND PATCH] init/Kconfig: Use short unix-style option instead
 of --longname
References: <1533701203-31019-1-git-send-email-yamada.masahiro@socionext.com>
From: Rob Landley <rob@landley.net>
Message-ID: <7c415401-8732-9cdd-44f7-1878e711b440@landley.net>
Date: Wed, 8 Aug 2018 12:19:18 -0500
MIME-Version: 1.0
In-Reply-To: <1533701203-31019-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Jiri Kosina <trivial@kernel.org>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

On 08/07/2018 11:06 PM, Masahiro Yamada wrote:
> From: Rob Landley <rob@landley.net>
> 
> Avoids warning messages with the latest release of toybox, which never
> bothered to implement the --longopts nothing was using.
> 
> Signed-off-by: Rob Landley <rob@landley.net>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> This was sent to the trivial ML some time ago,
> but not applied yet.
> 
> I will apply this to kbuild tree for v4.19

Thank you.

(I have a pile of small kernel fixes but haven't had time+energy to follow up on
them recently.)

Rob
