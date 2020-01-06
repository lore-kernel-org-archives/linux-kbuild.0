Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f202.google.com ([209.85.160.202]:33692 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgAFHeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:34:37 -0500
Received: by mail-qt1-f202.google.com with SMTP id l25so33910481qtu.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:34:36 -0800 (PST)
Date: Sun, 05 Jan 2020 23:34:33 -0800
In-Reply-To: <20200104150238.19834-4-masahiroy@kernel.org>
Message-Id: <xr93imlp6nsm.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-4-masahiroy@kernel.org>
Subject: Re: [PATCH v2 03/13] gen_initramfs_list.sh: fix the tool name in the comment
From: Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> There is no tool named "gen_initramfs". The correct name is
> "gen_init_cpio".
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Greg Thelen <gthelen@google.com>
