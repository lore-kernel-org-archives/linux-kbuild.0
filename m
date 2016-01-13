Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:35160 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162AbcAMRFq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2016 12:05:46 -0500
Received: by mail-yk0-f177.google.com with SMTP id x67so496816316ykd.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2016 09:05:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1452189189-31188-1-git-send-email-mst@redhat.com>
References: <1452189189-31188-1-git-send-email-mst@redhat.com>
Date: Wed, 13 Jan 2016 17:05:45 +0000
Message-ID: <CAAG0J995iCNwdN6PpuJfzo+TVWNXR3UVqS9v-4HXbryyvMn+=w@mail.gmail.com>
Subject: Re: [PATCH] ld-version: fix it on Fedora
From: James Hogan <james.hogan@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Daniel Sanders <Daniel.Sanders@imgtec.com>

Cc'ing Daniel, who has hit further breakage due to unusual version numbers.

On 7 January 2016 at 17:55, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Fedora 23, ld --version outputs:
> GNU ld version 2.25-15.fc23
>
> But ld-version.sh fails to parse this, so e.g.  mips build fails to
> enable VDSO, printing a warning that binutils >= 2.24 is required.
>
> To fix, teach ld-version to parse this format.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>
> Which tree should this be merged through? Mine? MIPS?
>
>  scripts/ld-version.sh | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 198580d..25d23c8 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -2,6 +2,8 @@
>  # extract linker version number from stdin and turn into single number
>         {
>         gsub(".*)", "");
> +       gsub(".*version ", "");
> +       gsub("-.*", "");
>         split($1,a, ".");
>         print a[1]*10000000 + a[2]*100000 + a[3]*10000 + a[4]*100 + a[5];
>         exit
> --
> MST
>
