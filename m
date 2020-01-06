Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f201.google.com ([209.85.210.201]:47611 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgAFHdm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:33:42 -0500
Received: by mail-pf1-f201.google.com with SMTP id e62so12167780pfh.14
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:33:42 -0800 (PST)
Date: Sun, 05 Jan 2020 23:33:39 -0800
In-Reply-To: <20200104150238.19834-2-masahiroy@kernel.org>
Message-Id: <xr93pnfx6nu4.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-2-masahiroy@kernel.org>
Subject: Re: [PATCH v2 01/13] initramfs: replace klibcdirs in Makefile with FORCE
From: Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> 'klibcdirs' was added by commit d39a206bc35d ("kbuild: rebuild initramfs
> if content of initramfs changes"). If this is just a matter of forcing
> execution of the recipe line, we can replace it with FORCE.
>
> I do not understand the purpose of
>
>    $(deps_initramfs): klibcdirs
>
> Remove it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Greg Thelen <gthelen@google.com>
