Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-he1eur01on0131.outbound.protection.outlook.com ([104.47.0.131]:17082
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752520AbdLEQcX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Dec 2017 11:32:23 -0500
Subject: Re: [PATCH v4 1/5] kasan: add compiler support for clang
References: <20171204191735.132544-1-paullawrence@google.com>
 <20171204191735.132544-2-paullawrence@google.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <5e96ec6f-214a-b623-eb1e-c50d91ba4819@virtuozzo.com>
Date: Tue, 5 Dec 2017 19:35:51 +0300
MIME-Version: 1.0
In-Reply-To: <20171204191735.132544-2-paullawrence@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Lawrence <paullawrence@google.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>



On 12/04/2017 10:17 PM, Paul Lawrence wrote:
> For now we can hard-code ASAN ABI level 5, since historical clang builds
> can't build the kernel anyway.  We also need to emulate gcc's
> __SANITIZE_ADDRESS__ flag, or memset() calls won't be instrumented.
> 
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> Signed-off-by: Paul Lawrence <paullawrence@google.com>
> ---

Acked-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
