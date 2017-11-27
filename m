Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:44965 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751834AbdK0X57 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 18:57:59 -0500
MIME-Version: 1.0
In-Reply-To: <20171127161345.17880-1-henning.schild@siemens.com>
References: <20171127161345.17880-1-henning.schild@siemens.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Mon, 27 Nov 2017 16:57:58 -0700
Message-ID: <CA+r1Zhho-mqtM6Z76pCPFOvxO3n0KR_2Q6fLXJvtBZv5YSU24Q@mail.gmail.com>
Subject: Re: [PATCH] builddeb: introduce variables for control-file customization
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Henning Schild <henning.schild@siemens.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, Konrad Schwarz <konrad.schwarz@siemens.com>

On Mon, Nov 27, 2017 at 9:13 AM, Henning Schild
<henning.schild@siemens.com> wrote:
> The debian packages coming out of "make *deb-pkg" lack some critical
> information in the control-files e.g. the "Depends:" field. If one
> tries to install a fresh system with such a "linux-image" debootstrap or
> multistrap might try to install the kernel before its deps and the
> package hooks will fail.

Has that shown up in practice?  The builddeb script goes back some years now...

> +       eval 'create_package "$kernel_headers_packagename" \
> +               "$kernel_headers_dir"' "$KDEB_OPTS_IMAGE_HEADERS"

eval in a shell script with arbitrary input can lead to shenanigans like

make bindeb-pkg KDEB_OPTS_IMAGE_HEADERS="; echo All your base"

and other potentially nastier things.  Probably not an issue for a
typical kernel developer sitting in front of his or her laptop, but if
I ran a big automated unattended build farm I might prefer a non-eval
alternative.

-- 
Jim
