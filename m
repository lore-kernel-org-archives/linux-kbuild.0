Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:43266 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752275AbdK2XJ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 18:09:56 -0500
Received: by mail-io0-f175.google.com with SMTP id s37so5508069ioe.10
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 15:09:56 -0800 (PST)
Date: Wed, 29 Nov 2017 15:09:52 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: Link time optimization for LTO/x86
Message-ID: <20171129230952.GA138088@samitolvanen.mtv.corp.google.com>
References: <20171127213423.27218-1-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org

Hi Andi,

On Mon, Nov 27, 2017 at 01:34:02PM -0800, Andi Kleen wrote:
> This is an updated version of my older LTO patchkit for gcc/x86
> This version doesn't need special binutils, but requires gcc 5+.
> It also is compatible with near all options (except MODVERSIONS)

Would you mind changing the config option prefix to LTO_GCC, for
example? It looks like there are a few places where gcc LTO needs
to be disabled, but clang LTO works fine, and vice versa.

My earlier clang LTO patches also had a solution for MODVERSIONS,
which might work with gcc as well.

Sami
