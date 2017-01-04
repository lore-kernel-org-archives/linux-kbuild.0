Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37859 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760008AbdADAX7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jan 2017 19:23:59 -0500
Received: by mail-it0-f48.google.com with SMTP id o141so289170170itc.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Jan 2017 16:23:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2b452e83-d74a-8d41-1f00-1764b2c767f1@redhat.com>
References: <1481925984-98605-1-git-send-email-keescook@chromium.org> <2b452e83-d74a-8d41-1f00-1764b2c767f1@redhat.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 3 Jan 2017 16:23:57 -0800
Message-ID: <CAGXu5j+7=h1UB0GGpRg3i1sWdntaDPHMFDZ8rF6hWXriT5J5Eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Introduce the initify gcc plugin
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Emese Revfy <re.emese@gmail.com>, Josh Triplett <josh@joshtriplett.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, minipli@ld-linux.so, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, David Brown <david.brown@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@poochiereds.net>, Sam Ravnborg <sam@ravnborg.org>

On Mon, Dec 19, 2016 at 10:24 AM, Laura Abbott <labbott@redhat.com> wrote:
> I gave this a spin on arm64 and it seems to boot up and run okay
> with just the "select HAVE_GCC_PLUGIN_INITIFY_INIT_EXIT if GCC_PLUGINS"
> added for arm64. The patches could probably use more review but
> I think it would be good to just fold this in for arm64 for ease of
> testing.

Thanks! I've added this to arm64 for a v5 soon.

-Kees

-- 
Kees Cook
Nexus Security
