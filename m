Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:35202 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754483AbeFMFUy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 01:20:54 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH v2] nconf: respect i-search pattern boundaries
In-Reply-To: <d22bf7c4-45ce-3354-8bbc-feb9c755f92c@infradead.org> (Randy
        Dunlap's message of "Tue, 12 Jun 2018 18:09:28 -0700")
References: <20180612190604.4889-1-dirk@gouders.net>
        <d22bf7c4-45ce-3354-8bbc-feb9c755f92c@infradead.org>
Date: Wed, 13 Jun 2018 07:18:26 +0200
Message-ID: <gh602nfen1.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Randy Dunlap <rdunlap@infradead.org> writes:

> On 06/12/2018 12:06 PM, Dirk Gouders wrote:
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
>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>> ---
>> Changes in v2: Correct S-O-B line, remove double search from subject.
>> ---
>>  scripts/kconfig/nconf.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> Hi Dirk,
>
> For v1 of the patch:  no, I wasn't using PageUp/PageDown, just the up/dow=
n arrow
> keys.
>
> Maybe I'm confused about /search in nconfig.  nconfig Help says:
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
> First of all, does this only search in the Kconfig prompt strings?

Hi Randy,

yes, it only searches the items in the current menu and this
probably was the reason to make you think the arrow keys don't work.

This is also the case for the i-search RFC I posted for mconf.  I know,
it would be extremely convenient to i-search in _all_ config symbols from
the top level menu and then navigate to the submenus that contain
matches but such a change needs a lot more work to be done.

Dirk

> (from top-level menu)
> OK, I want to search for "debug", so I enter "/debug" and the upper left
> corner displays: searching: debug
>
> The nconfig highlight bar goes to the Device Drivers menu.
> That's it.  It hasn't found "debug" (it found "de" AFAICT).
> Using Up/Down arrow keys don't do anything.  I gave up.
>
> What am I doing wrong?
>
> thanks,
