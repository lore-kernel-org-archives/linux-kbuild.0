Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0025.hostedemail.com ([216.40.44.25]:44193 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727227AbgBYW1u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 17:27:50 -0500
Message-ID: <3b7b2b366220c9ba39ebc241ba22c0304f0d61b0.camel@perches.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
From: Joe Perches <joe@perches.com>
Date: Tue, 25 Feb 2020 14:20:19 -0800
In-Reply-To: <202002251353.25A016CD@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
         <202002242003.870E5F80@keescook>
         <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
         <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
         <202002251353.25A016CD@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, 2020-02-25 at 13:56 -0800, Kees Cook wrote:
> I think we should take a specific version stand as the
> "minimum" version. Being able to build x86 defconfig is a good minimum
> IMO.

Agree.

It's odd to say that clang 4 is fine for arm when it's
not fine for x86.  It's also reasonable to expect arm
users to upgrade their compiler to a more recent version
when the only cost is a very small bit of time.
