Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qv1-f67.google.com ([209.85.219.67]:40978 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbgCWRu4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Mar 2020 13:50:56 -0400
MIME-Version: 1.0
References: <CAHmME9ptzBzzn+jOo=azZagB=TTFbc2vzdcYurfsE0_1nvKF+g@mail.gmail.com>
 <50c6bd77-fb16-852a-adcc-3976550f6f81@fb.com> <CAHmME9r+anBCRihmhi-Jsy6o8bcZkbwiRRW2ZYytUd5uTrha-w@mail.gmail.com>
In-Reply-To: <CAHmME9r+anBCRihmhi-Jsy6o8bcZkbwiRRW2ZYytUd5uTrha-w@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 23 Mar 2020 10:50:42 -0700
Message-ID: <CAEf4BzYXN=xNu6qeYZR_fDu3NRw9hMB7-Ehs=diB+N_aYkOWmw@mail.gmail.com>
Subject: Re: using libbpf in external projects
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>, nicolas@serveur.io, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Mar 22, 2020 at 11:00 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Thanks! That's much nicer to use:
>
> https://git.zx2c4.com/netifexec/commit/?id=8a39f70c981264500d27e90bbd5e3baf8f2d10d3


You probably don't want to compile libbpf with your custom rules. See
BCC libbpf-tools [0] on how to do this when you use libbpf as a
submodule. The idea is to do a sub-make call and let libbpf's Makefile
deal with everything.

Having said that, though, libbpf is packaged properly for Fedora (and
I think maybe for OpenSUSE and Debian, but not sure), so if you can
rely on libbpf package, that would probably be easiest and best. If
Linux distribution(s) you are targeting doesn't have libbpf package
yet, we'd really appreciate you reaching out to packager and asking
them to follow Fedora and do it :) Would make everyone's job easier in
long term. Thanks!
