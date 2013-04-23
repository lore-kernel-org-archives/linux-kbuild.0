Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:64614 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757195Ab3DWVuu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Apr 2013 17:50:50 -0400
Received: by mail-we0-f175.google.com with SMTP id t11so1099827wey.34
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2013 14:50:49 -0700 (PDT)
Date: Tue, 23 Apr 2013 23:50:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 5/6] kconfig: implement KCONFIG_PROBABILITY for randconfig
Message-ID: <20130423215044.GA20111@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
 <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Peter Korsgaard <jacmet@uclibc.org>

Michal, All,

On Mon, Apr 22, 2013 at 11:31:24PM +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Introduce a KCONFIG_PROBABILITY environment variable to tweak the
> probability between 0 (all options off) and 100 (all options on).

Please, drop this patch: randconfig is utterly broken is a very subtle
way (even without this patch applied), which I still have to track down,
and I'm not confident I can find and properly fis it before the end of
the week.

The core of the problem is the following code (as seen in current master
from Linus' tree):

scripts/kconfig/confdata.c:
[--SNIP--]
  1106  void conf_set_all_new_symbols(enum conf_def_mode mode)
  1107  {
  1108          struct symbol *sym, *csym;
  1109          int i, cnt;
  1110
  1111          for_all_symbols(i, sym) {
  1112                  if (sym_has_value(sym))
  1113                          continue;
  1114                  switch (sym_get_type(sym)) {
  1115                  case S_BOOLEAN:
  1116                  case S_TRISTATE:
  1117                          switch (mode) {
  1118                          case def_yes:
  1119                                  sym->def[S_DEF_USER].tri = yes;
  1120                                  break;
  1121                          case def_mod:
  1122                                  sym->def[S_DEF_USER].tri = mod;
  1123                                  break;
  1124                          case def_no:
  1125                                  sym->def[S_DEF_USER].tri = no;
  1126                                  break;
  1127                          case def_random:
  1128                                  cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
  1129                                  sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
  1130                                  break;
  1131                          default:
  1132                                  continue;
  1133                          }
  1134                          if (!(sym_is_choice(sym) && mode == def_random))
  1135                                  sym->flags |= SYMBOL_DEF_USER;
  1136                          break;
  1137                  default:
  1138                          break;
  1139                  }
  1140
  1141          }
  1142
  1143          sym_clear_all_valid();
[--SNIP--]

Fact is, sym_get_type(sym) is never ever equal to S_TRISTATE when we
test it on line 1128.

I'm currently investigating, but I suspect that's because CONFIG_MODULES
is not yet set, which only happens after we call to sym_clear_all_valid()
later on line 1143, which is too late.

I'll be testing this solution (pseudo-code):

    find symbol defining MODULES
        randomly set it to y or no
    sym_clear_all_valid();
    for_all_symbols(i, sym) {
        current code
    }
    sym_clear_all_valid();

More on this later. For now, just drop this probability patch. The other
patches are still good for 3.10.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
