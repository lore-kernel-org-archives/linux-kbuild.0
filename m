Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:36765 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932926AbeFLTDr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 15:03:47 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH] nconf: respect i-search search pattern boundaries
In-Reply-To: <e6ca0598-bdac-aef7-5b5d-5b593f122ba8@infradead.org> (Randy
        Dunlap's message of "Tue, 12 Jun 2018 09:19:38 -0700")
References: <20180612120441.22325-1-dirk@gouders.net>
        <e6ca0598-bdac-aef7-5b5d-5b593f122ba8@infradead.org>
Date: Tue, 12 Jun 2018 21:01:06 +0200
Message-ID: <ghd0wvg77x.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Randy Dunlap <rdunlap@infradead.org> writes:

> On 06/12/2018 05:04 AM, Dirk Gouders wrote:
>> This patch adds boundary checks for nconf's i-search pattern.
>>=20
>> Further, the pattern buffer is always bzero'ed when '/' is
>> pressed, so the second line in the code below was not needed (and
>> otherwise wouldn't have worked as expected):
>>=20
>> 	state->pattern[strlen(state->pattern)] =3D c;
>> 	state->pattern[strlen(state->pattern)] =3D '\0';
>>=20
>> Finally, the pattern length was reduced to a length that still
>> seems sufficient but will not fill more than the top line of the
>> screen, thus eliminating special treatment needs on resizes or normal
>> exit of i-search.
>>=20
>> Signed-off-by: Dirk Gouders
>
> S-O-B: line should also have your email address after your name.
>
>> ---
>>  scripts/kconfig/nconf.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> Your patch descsription makes sense.  I tested nconf (make nconfig)
> both with and without this patch.  I didn't like the /search results
> in either case.  F1 (Help) says:
>
>  =E2=94=82=E2=94=82 Start incremental, case-insensitive search for STRING=
 in menu entries,   =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82     no regex support, STRING is displayed in upper le=
ft corner           =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82                             </>STRING                =
                    =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82     Remove last character   <Backspace>              =
                    =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82     Jump to next hit        <Down>                   =
                    =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82     Jump to previous hit    <Up>                     =
                    =E2=94=82=E2=94=82
>  =E2=94=82=E2=94=82 Exit menu search mode       </>  <Esc>
>
> but I couldn't get <Down> =3D=3D "Jump to next hit" to work for me at all
> (with or without the patch).

Thank you for testing and commenting on the patch.  I will correct the
S-O-B line and also remove one "search" from the subject.

The navigation through matches works here, did use the up/down arrow
keys?  Because of your comment, I also tested page-up/page-down and
noticed that those keys add 'S', 'R' to the search pattern,
respectively...

Dirk
