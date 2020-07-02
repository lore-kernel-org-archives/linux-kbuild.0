Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGBPSs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jul 2020 11:18:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07729C08C5C1
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Jul 2020 08:18:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j19so6752075pgm.11
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jul 2020 08:18:48 -0700 (PDT)
Date: Thu, 2 Jul 2020 08:18:45 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: Kernel compression benchmarks
Message-ID: <202007020818.87EA89106@keescook>
References: <1588791882.08g1378g67.none.ref@localhost>
 <1588791882.08g1378g67.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588791882.08g1378g67.none@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: linux-kernel@vger.kernel.org, Nick Terrell <nickrterrell@gmail.com>, Nick Terrell <terrelln@fb.com>, Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> ZSTD compression patches have been sent in a number of times over the 
> past few years. Every time, someone asks for benchmarks. Every time, 
> someone is concerned about compression time. Sometimes, someone provides 
> benchmarks.

Where's the latest series for this, btw? I thought it had landed. :P It
seemed like it was done.

-- 
Kees Cook
