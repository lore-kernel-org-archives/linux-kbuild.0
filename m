Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:37661 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbfHMQIN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 12:08:13 -0400
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190801060657.5932-1-efremov@linux.com>
 <CAK7LNASdhyhhqyf1wcga7UDYoo=2t-0ZaqTmQdcsFOfAR580sw@mail.gmail.com>
In-Reply-To: <CAK7LNASdhyhhqyf1wcga7UDYoo=2t-0ZaqTmQdcsFOfAR580sw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Aug 2019 01:07:28 +0900
Message-ID: <CAK7LNAQG7DM_2+JJ+bJdre12HcbZY7zGfHk3AU66S0ESjxMbnA@mail.gmail.com>
Subject: Re: [PATCH v5] modpost: check for static EXPORT_SYMBOL* functions
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Denis,


On Thu, Aug 8, 2019 at 12:12 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, Aug 1, 2019 at 3:07 PM Denis Efremov <efremov@linux.com> wrote:
> >
> > This patch adds a check to warn about static EXPORT_SYMBOL* functions
> > during the modpost. In most of the cases, a static symbol marked for
> > exporting is an odd combination that should be fixed either by deleting
> > the exporting mark or by removing the static attribute and adding the
> > appropriate declaration to headers.
> >
> > This check could help to detect the following problems:
> > 1. 550113d4e9f5 ("i2c: add newly exported functions to the header, too")
> > 2. 54638c6eaf44 ("net: phy: make exported variables non-static")
> > 3. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> > 4. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> > 5. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> > 6. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
> > 7. 14b4c48bb1ce ("gve: Remove the exporting of gve_probe")
> > 8. 9b79ee9773a8 ("scsi: libsas: remove the exporting of sas_wait_eh")
> > 9. ...
> >
> > The build time impact is very limited and is almost at the unnoticeable
> > level (< 1 sec).
> >
> > Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
> > Signed-off-by: Denis Efremov <efremov@linux.com>
> > ---
>
> Applied to linux-kbuild. Thanks.


I noticed this patch produces false-positive warnings
for external module build.


When I built my external module, it showed the following,
the last five are false positives.

make[1]: Entering directory '/home/masahiro/workspace/linux-kbuild'
  Building modules, stage 2.
  MODPOST 2 modules
WARNING: "drm_client_close" [vmlinux] is a static EXPORT_SYMBOL
WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
WARNING: "nf_log_dump_packet_common" [net/netfilter/nf_log_common] is
a static EXPORT_SYMBOL_GPL
WARNING: "nf_log_l2packet" [net/netfilter/nf_log_common] is a static
EXPORT_SYMBOL_GPL
WARNING: "nf_log_dump_sk_uid_gid" [net/netfilter/nf_log_common] is a
static EXPORT_SYMBOL_GPL
WARNING: "nf_log_dump_udp_header" [net/netfilter/nf_log_common] is a
static EXPORT_SYMBOL_GPL
WARNING: "nf_log_dump_tcp_header" [net/netfilter/nf_log_common] is a
static EXPORT_SYMBOL_GPL
make[1]: Leaving directory '/home/masahiro/workspace/linux-kbuild'


I squashed the following fix-up.


diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3e6d36ddfcdf..2773f9f9bae2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2386,6 +2386,7 @@ static void read_dump(const char *fname,
unsigned int kernel)
                s = sym_add_exported(symname, mod, export_no(export));
                s->kernel    = kernel;
                s->preloaded = 1;
+               s->is_static = 0;
                sym_update_crc(symname, mod, crc, export_no(export));
        }
        release_file(file, size);


-- 
Best Regards
Masahiro Yamada
