Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64303 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfD0GaW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 02:30:22 -0400
MIME-Version: 1.0
References: <20190426222237.13209-1-colin.king@canonical.com>
In-Reply-To: <20190426222237.13209-1-colin.king@canonical.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 27 Apr 2019 15:29:30 +0900
Message-ID: <CAK7LNATC5b9yx79sF55hw1X9vZTJK8H+WsLRfy81_chZYRgTYw@mail.gmail.com>
Subject: Re: [PATCH][next] unicode: fix dereference of a potentially null pointer
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olaf Weber <olaf@sgi.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Forwarding because this file is not in my tree.





On Sat, Apr 27, 2019 at 7:22 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer 'tree' is deferenced when assigning pointer 'trie', however
> trie is being null checked a few lines later, so it could potentially
> be null. Fix the potential null pointer dereference by only dereferencing
> it after it has been null checked.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: b08fcacaaaf4 ("unicode: introduce UTF-8 character database")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  scripts/mkutf8data.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mkutf8data.c b/scripts/mkutf8data.c
> index 12ce94b43be6..0563ba679bbb 100644
> --- a/scripts/mkutf8data.c
> +++ b/scripts/mkutf8data.c
> @@ -2706,7 +2706,7 @@ static utf8leaf_t *utf8hangul(const char *str, unsigned char *hangul)
>  static utf8leaf_t *utf8nlookup(struct tree *tree, unsigned char *hangul,
>                                const char *s, size_t len)
>  {
> -       utf8trie_t      *trie = utf8data + tree->index;
> +       utf8trie_t      *trie;
>         int             offlen;
>         int             offset;
>         int             mask;
> @@ -2716,6 +2716,7 @@ static utf8leaf_t *utf8nlookup(struct tree *tree, unsigned char *hangul,
>                 return NULL;
>         if (len == 0)
>                 return NULL;
> +       trie = utf8data + tree->index;
>         node = 1;
>         while (node) {
>                 offlen = (*trie & OFFLEN) >> OFFLEN_SHIFT;
> --
> 2.20.1
>


--
Best Regards
Masahiro Yamada
