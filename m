Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sonic317-20.consmr.mail.gq1.yahoo.com ([98.137.66.146]:38967
        "EHLO sonic317-20.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731542AbgGARc7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 13:32:59 -0400
Date: Wed, 01 Jul 2020 13:32:52 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: Kernel compression benchmarks
References: <20200701153028.GA30962.ref@hsiangkao-HP-ZHAN-66-Pro-G1>
        <20200701153028.GA30962@hsiangkao-HP-ZHAN-66-Pro-G1>
In-Reply-To: <20200701153028.GA30962@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Message-Id: <1593624505.w282woxb43.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gao Xiang <hsiangkao@aol.com>
Cc: Chris Mason <clm@fb.com>, gregkh@linuxfoundation.org, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, Nick Terrell <nickrterrell@gmail.com>, Norbert Lange <nolange79@gmail.com>, Petr Malat <oss@malat.biz>, Patrick Williams <patrick@stwcx.xyz>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, Sedat Dilek <sedat.dilek@gmail.com>, Nick Terrell <terrelln@fb.com>, x86@kernel.org

Excerpts from Gao Xiang's message of July 1, 2020 11:50 am:
>  Anyway, I think LZMA (xz) is still useful and which is more
>  friendly to fixed-sized output compression than Zstd yet (But
>  yeah, I'm not familar with all ZSTD internals. I will dig
>  into that if I've more extra time).

Yes, I agree. If you look at the graphs, LZMA2 (xz/7zip) still produces=20
smaller results, even compared to zstd maximum settings, so definitely=20
LZMA2 should be kept, at least for now. I am only suggesting removing=20
LZMA, since it has no benefits over xz and zstd combination (bigger than=20
xz, slower than zstd).

>> - modern compressors (xz, lz4, zstd) decompress about as fast for each=20
>>   compression level, only requiring more memory
>=20
>  lz4 has fixed sliding window (dictionary, 64k), so it won't
>  require more memory among different compression level when
>  decompressing.

Yes, this is true. I tried to simplify among all compressors, but I=20
think I simplified too much. Thanks for clarifying.

Cheers,
Alex.
