Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18234 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1P5B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 11:57:01 -0400
MIME-Version: 1.0
References: <20190827111437.22000-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20190827111437.22000-1-heikki.krogerus@linux.intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 29 Aug 2019 00:56:18 +0900
Message-ID: <CAK7LNARoy_Q40zdr7YSkJSV_N8WcMpL8Zunwnf16QTCYUbessg@mail.gmail.com>
Subject: Re: [PATCH] modpost: add guid_t type definition
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 27, 2019 at 8:14 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Since guid_t is the recommended data type for UUIDs in
> kernel (and I guess uuid_le is meant to be ultimately
> replaced with it), it should be made available here as
> well.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/mod/file2alias.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index e17a29ae2e97..c91eba751804 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -34,6 +34,11 @@ typedef Elf64_Addr   kernel_ulong_t;
>  typedef uint32_t       __u32;
>  typedef uint16_t       __u16;
>  typedef unsigned char  __u8;
> +typedef struct {
> +       __u8 b[16];
> +} guid_t;
> +
> +/* backwards compatibility, don't use in new code */
>  typedef struct {
>         __u8 b[16];
>  } uuid_le;
> --
> 2.23.0.rc1
>


-- 
Best Regards
Masahiro Yamada
