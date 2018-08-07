Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:59365 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732135AbeHGMWB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Aug 2018 08:22:01 -0400
Date: Tue, 7 Aug 2018 05:08:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: debugging kbuild
Message-ID: <20180807100822.GD31204@gate.crashing.org>
References: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkozP4t3AusfnKfrTmhyrXh4JW4m-ersfnoeTWXcMfJSw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Aug 06, 2018 at 04:31:14PM -0700, Nick Desaulniers wrote:
> Is there a way to print the exact command that's being invoked from
> Make? For example, some of the macro's in scripts/Kbuild.include are
> tricky to unwind. Is there a way to dump each sub command being run?

There always is strace...  Or maybe  make -dj  and friends.


Segher
