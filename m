Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbgF1TH7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 15:07:59 -0400
Date: Sun, 28 Jun 2020 15:07:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
Message-ID: <20200628150755.523fbb2c@oasis.local.home>
In-Reply-To: <20200628015041.1000002-1-masahiroy@kernel.org>
References: <20200628015041.1000002-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Sun, 28 Jun 2020 10:50:41 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> convenient way to filter out flags for every object in a directory.
> 
> Add ccflags-remove-y and asflags-remove-y to make it easily.
> 
> Use ccflags-remove-y to clean up some Makefiles.
> 
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Nice feature!

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
