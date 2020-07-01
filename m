Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sonic314-19.consmr.mail.gq1.yahoo.com ([98.137.69.82]:43730
        "EHLO sonic314-19.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731638AbgGAPue (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:50:34 -0400
Date: Wed, 1 Jul 2020 23:50:05 +0800
From: Gao Xiang <hsiangkao@aol.com>
Subject: Re: Kernel compression benchmarks
Message-ID: <20200701153028.GA30962@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588791882.08g1378g67.none@localhost>
References: <20200701153028.GA30962.ref@hsiangkao-HP-ZHAN-66-Pro-G1>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: linux-kernel@vger.kernel.org, Nick Terrell <nickrterrell@gmail.com>, Nick Terrell <terrelln@fb.com>, Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

Hi Alex,

(sorry... maybe my @gmx.com email is broken again...)

On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> 
> My conclusions:
> 
> - zstd is an improvement on almost all metrics.
> - bzip2 and lzma should be removed post-haste.

I'm some familar with LZ4 and LZMA (xz) internals.

I'd like to add some notes from the principle perspective,
but I'm not sure if I would join some further topic
about this...

 XZ is another form of LZMA2, which is based on LZMA.
 It uses range coder technology. In principle, it has better
 compession ratio with slowest speed (due to multiplication
 by bits rather than lookup table). Instead, Zstd uses huffman
 (which is much like deflate, aka. gzip) and FSE (If I'm not
  wrong about Zstd)...

 So in general (apart from the specific implementation),
 the decompression speed vs compression ratio ralationship are
  LZ4  -  Zstd  -  LZMA

 Some arguments such as compression level have impact on
 LZ matchfinder (yeah, except for bzip2, all algorithms
 are LZ-based) and dictionary size. And some specific
 compressors aren't well-optimized (e.g. zlib).

 Anyway, I think LZMA (xz) is still useful and which is more
 friendly to fixed-sized output compression than Zstd yet (But
 yeah, I'm not familar with all ZSTD internals. I will dig
 into that if I've more extra time).

> - lzo should be removed once zstd is merged.
> - compression level is important to consider for compression speed: the 
>   default lz4 -1 compresses very fast but has a very poor compression 
>   ratio. zstd -19 compresses barely better than zstd -18, but takes 
>   significantly longer to compress.
> - compression level should be configurable: lz4 -1 is useful, but so is 
>   lz4 -9. zstd -1 is useful, but so is zstd -19. zstd -1 is useful for 
>   developers who want kernel builds as fast as possible, zstd -19 for 
>   everybody else.
> - gzip is by far not the fastest compressor (even excluding cat)
> - modern compressors (xz, lz4, zstd) decompress about as fast for each 
>   compression level, only requiring more memory

 lz4 has fixed sliding window (dictionary, 64k), so it won't
 require more memory among different compression level when
 decompressing.

Thanks,
Gao Xiang
