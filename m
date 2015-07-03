Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-3.rrze.uni-erlangen.de ([131.188.11.22]:54804 "EHLO
	mx-rz-3.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755113AbbGCLdy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:33:54 -0400
Message-ID: <5596731F.20309@fau.de>
Date: Fri, 03 Jul 2015 13:33:51 +0200
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
MIME-Version: 1.0
Subject: Re: Kconfig: '+config' valid syntax?
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>	<1435827662.2423.4.camel@tiscali.nl>	<55952723.80801@fau.de>	<1435839005.2423.28.camel@tiscali.nl>	<55963AD7.3040905@fau.de>	<1435913987.2423.38.camel@tiscali.nl>	<559655E3.6010400@fau.de> <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
In-Reply-To: <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------080502000700010808080008"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

This is a multi-part message in MIME format.
--------------080502000700010808080008
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 07/03/2015 12:46, Ulf Magnusson wrote:
> 
> Except for scattered accidents like in the original message, which are
> hopefully pretty rare and easy to fix, the only documented thing that depends
> on that lexer sloppiness is the ---help--- "token".
> 
> I'd just add "---help---" as another T_HELP alias (or get rid of it altogether,
> but that's probably more work than it's worth). Tightening things up should be
> safe after that.
> 
> /Ulf
> 

So we might want to do something like the attached patch, right?

Unfortunately, when I generate the zconf.{hash,lex,tab}.c files on my
machine, they have some notable differences to the _shipped versions:

ruprecht@box:linux-next$ diff -u zconf.tab.c zconf.tab.c_shipped
-  return yyresult;
+  /* Make sure YYID is used.  */
+  return YYID (yyresult);

and I can't find any Documentation on how to properly rebuild the
_shipped files... Does anybody have a hint on that?

Regards,

Andreas

--------------080502000700010808080008
Content-Type: text/x-patch;
 name="zconf.l.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="zconf.l.patch"

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 200a3fe..84a5d05 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -106,7 +106,15 @@ n	[A-Za-z0-9_]
 		zconflval.string =3D text;
 		return T_WORD;
 	}
-	.
+	"---help---"	{
+		/* Support old syntax for help statement */
+		return T_HELP;
+	}
+	.	{
+		fprintf(stderr,
+		        "%s:%d:warning: ignoring unsupported character '%c'\n",
+		        zconf_curname(), zconf_lineno(), *yytext);
+	}
 	\n	{
 		BEGIN(INITIAL);
 		current_file->lineno++;
@@ -132,7 +140,6 @@ n	[A-Za-z0-9_]
 		BEGIN(STRING);
 	}
 	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
-	---	/* ignore */
 	({n}|[-/.])+	{
 		const struct kconf_id *id =3D kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {

--------------080502000700010808080008--
