Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:32977 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgCWF7g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Mar 2020 01:59:36 -0400
MIME-Version: 1.0
References: <CAHmME9ptzBzzn+jOo=azZagB=TTFbc2vzdcYurfsE0_1nvKF+g@mail.gmail.com>
 <50c6bd77-fb16-852a-adcc-3976550f6f81@fb.com>
In-Reply-To: <50c6bd77-fb16-852a-adcc-3976550f6f81@fb.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 22 Mar 2020 23:59:22 -0600
Message-ID: <CAHmME9r+anBCRihmhi-Jsy6o8bcZkbwiRRW2ZYytUd5uTrha-w@mail.gmail.com>
Subject: Re: using libbpf in external projects
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yonghong Song <yhs@fb.com>
Cc: bpf@vger.kernel.org, nicolas@serveur.io, linux-kbuild@vger.kernel.org

Thanks! That's much nicer to use:

https://git.zx2c4.com/netifexec/commit/?id=8a39f70c981264500d27e90bbd5e3baf8f2d10d3
