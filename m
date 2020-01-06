Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33091 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727139AbgAFVdq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 16:33:46 -0500
Date: Mon, 06 Jan 2020 13:33:36 -0800 (PST)
Message-Id: <20200106.133336.719905028750983361.davem@redhat.com>
Subject: Re: [PATCH] modpost: assume STT_SPARC_REGISTER is defined
From: David Miller <davem@redhat.com>
In-Reply-To: <20200104153651.2258-1-masahiroy@kernel.org>
References: <20200104153651.2258-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, sparclinux@vger.kernel.org, arnd@arndb.de, bcollins@debian.org, michal.lkml@markovi.net, linux-kernel@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun,  5 Jan 2020 00:36:51 +0900

> Commit 8d5290149ee1 ("[SPARC]: Deal with glibc changing macro names in
> modpost.c") was more than 14 years ago. STT_SPARC_REGISTER is hopefully
> defined in elf.h of recent C libraries.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: David S. Miller <davem@davemloft.net>
