Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:35370 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731300AbeHGBwX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 21:52:23 -0400
Subject: Re: debugging kbuild
References: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b1acffb3-bed3-a2bb-a14c-5de50159ec76@infradead.org>
Date: Mon, 6 Aug 2018 16:40:55 -0700
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 08/06/2018 04:31 PM, Nick Desaulniers wrote:
> Is there a way to print the exact command that's being invoked from
> Make? For example, some of the macro's in scripts/Kbuild.include are
> tricky to unwind. Is there a way to dump each sub command being run?
> 

Yamada-san can answer that much better than I can.

I just begin with "make V=1" for verbose command logging.
and it will be verbose.

-- 
~Randy
