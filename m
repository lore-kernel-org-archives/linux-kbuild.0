Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58437 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725925AbgENLfE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 07:35:04 -0400
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com>
 <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
 <20200512200114.64vo5lbl7wk2tzxk@google.com>
 <CAKwvOdnArcsqusvmMDUJyTjVhkOufJZoRHxg-ARDfPhfjNj_JA@mail.gmail.com>
From: Nick Clifton <nickc@redhat.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
Message-ID: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
Date: Thu, 14 May 2020 12:34:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnArcsqusvmMDUJyTjVhkOufJZoRHxg-ARDfPhfjNj_JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, "H.J. Lu" <hjl.tools@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>

Hi Nick,

> + Nick, H.J.
> I'm unfamiliar with the git tag conventions of binutils.  Does a patch
> that landed in 2.25.51.0.4 mean it shipped in the official 2.25
> release, or 2.26 release?  Specifically, commit 19a7fe52ae3d.

2.26.

The convention is that a released form of the binutils has a version
number of X.XX or possible X.XX.N.  The current mainline development 
sources have a version of X.XX.50 where X.XX is the latest release.
(So the current mainline sources are version 2.34.50).  When a release
happens the XX value is incremented by one as part of the release
process, and the .50 is dropped.  (So the next binutils release will 
be 2.35).

So 2.25.51.0.4 is a development version which will then have been
released as binutils 2.26.

Cheers
  Nick
