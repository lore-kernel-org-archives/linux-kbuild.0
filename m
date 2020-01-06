Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:51221 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAFHvw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:51:52 -0500
Received: by mail-pg1-f201.google.com with SMTP id g20so21571242pgb.18
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:51:51 -0800 (PST)
Date: Sun, 05 Jan 2020 23:51:48 -0800
In-Reply-To: <20200104150238.19834-9-masahiroy@kernel.org>
Message-Id: <xr93a7716mzv.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-9-masahiroy@kernel.org>
Subject: Re: [PATCH v2 08/13] initramfs: specify $(src)/gen_initramfs.sh as a
 prerequisite in Makefile
From: Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> Specify the dependency directly in the Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Greg Thelen <gthelen@google.com>
