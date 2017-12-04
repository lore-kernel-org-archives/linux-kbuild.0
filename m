Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr20110.outbound.protection.outlook.com ([40.107.2.110]:54284
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753144AbdLDRF6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 12:05:58 -0500
Subject: Re: [PATCH v3 3/5] kasan: support alloca() poisoning
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
References: <20171201213643.2506-1-paullawrence@google.com>
 <20171201213643.2506-4-paullawrence@google.com>
 <20171204164240.GA24425@infradead.org>
 <fb09a40f-1fae-ce4c-9d7c-a13c284b19e9@virtuozzo.com>
Message-ID: <e85d8503-b149-b90f-7737-684e8122d95b@virtuozzo.com>
Date: Mon, 4 Dec 2017 20:09:25 +0300
MIME-Version: 1.0
In-Reply-To: <fb09a40f-1fae-ce4c-9d7c-a13c284b19e9@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Paul Lawrence <paullawrence@google.com>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>



On 12/04/2017 07:55 PM, Andrey Ryabinin wrote:
> 
> 
> On 12/04/2017 07:42 PM, Christoph Hellwig wrote:
>> I don't think we are using alloca in kernel mode code, and we shouldn't.
>> What do I miss?  Is this hidden support for on-stack VLAs?  I thought
>> we'd get rid of them as well.
>>
> 
> Yes, this is for on-stack VLA. Last time I checked, we still had a few.
> 

E.g. building with -Wvla:


/home/andrew/linux/sound/core/pcm_native.c: In function ‘constrain_params_by_rules’:
/home/andrew/linux/sound/core/pcm_native.c:326:2: warning: ISO C90 forbids variable length array ‘rstamps’ [-Wvla]
  unsigned int rstamps[constrs->rules_num];
  ^~~~~~~~
In file included from /home/andrew/linux/crypto/cbc.c:14:0:
/home/andrew/linux/include/crypto/cbc.h: In function ‘crypto_cbc_decrypt_inplace’:
/home/andrew/linux/include/crypto/cbc.h:116:2: warning: ISO C90 forbids variable length array ‘last_iv’ [-Wvla]
  u8 last_iv[bsize];
  ^~
/home/andrew/linux/crypto/pcbc.c: In function ‘crypto_pcbc_encrypt_inplace’:
/home/andrew/linux/crypto/pcbc.c:75:2: warning: ISO C90 forbids variable length array ‘tmpbuf’ [-Wvla]
  u8 tmpbuf[bsize];
  ^~
/home/andrew/linux/crypto/pcbc.c: In function ‘crypto_pcbc_decrypt_inplace’:
/home/andrew/linux/crypto/pcbc.c:147:2: warning: ISO C90 forbids variable length array ‘tmpbuf’ [-Wvla]
  u8 tmpbuf[bsize] __aligned(__alignof__(u32));
  ^~
/home/andrew/linux/crypto/cts.c: In function ‘cts_cbc_encrypt’:
/home/andrew/linux/crypto/cts.c:107:2: warning: ISO C90 forbids variable length array ‘d’ [-Wvla]
  u8 d[bsize * 2] __aligned(__alignof__(u32));
  ^~
/home/andrew/linux/crypto/cts.c: In function ‘cts_cbc_decrypt’:
/home/andrew/linux/crypto/cts.c:186:2: warning: ISO C90 forbids variable length array ‘d’ [-Wvla]
  u8 d[bsize * 2] __aligned(__alignof__(u32));
  ^~
/home/andrew/linux/crypto/ctr.c: In function ‘crypto_ctr_crypt_final’:
/home/andrew/linux/crypto/ctr.c:61:2: warning: ISO C90 forbids variable length array ‘tmp’ [-Wvla]
  u8 tmp[bsize + alignmask];
  ^~
/home/andrew/linux/crypto/ctr.c: In function ‘crypto_ctr_crypt_inplace’:
/home/andrew/linux/crypto/ctr.c:109:2: warning: ISO C90 forbids variable length array ‘tmp’ [-Wvla]
  u8 tmp[bsize + alignmask];

