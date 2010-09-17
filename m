Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:63352 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753912Ab0IQWRB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Sep 2010 18:17:01 -0400
Received: by wyf22 with SMTP id 22so2834846wyf.19
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Sep 2010 15:16:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284220282-3500-10-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-10-git-send-email-lacombar@gmail.com>
Date: Fri, 17 Sep 2010 18:16:59 -0400
Message-ID: <AANLkTi=swot9HqRNfAcPFY87HBbjxVxC4k3v8yysR=Mq@mail.gmail.com>
Subject: Re: [PATCH 09/15] kconfig: replace KERNELVERSION usage by the
 mainmenu's prompt
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

On Sat, Sep 11, 2010 at 11:51 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/confdata.c |   12 ++++--------
>  scripts/kconfig/gconf.c    |    5 +----
>  scripts/kconfig/mconf.c    |    6 +-----
>  scripts/kconfig/nconf.c    |    6 +-----
>  scripts/kconfig/qconf.cc   |    4 ++--
>  5 files changed, 9 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 1636213..7d48a51 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -133,7 +133,6 @@ void init_main_window(const gchar * glade_file)
>        GladeXML *xml;
>        GtkWidget *widget;
>        GtkTextBuffer *txtbuf;
> -       char title[256];
>        GtkStyle *style;
>
>        xml = glade_xml_new(glade_file, "window1", NULL);
> @@ -210,9 +209,7 @@ void init_main_window(const gchar * glade_file)
>                                          /*"style", PANGO_STYLE_OBLIQUE, */
>                                          NULL);
>
> -       sprintf(title, _("Linux Kernel v%s Configuration"),
> -               getenv("KERNELVERSION"));
> -       gtk_window_set_title(GTK_WINDOW(main_wnd), title);
> +       gtk_window_set_title(GTK_WINDOW(main_wnd), rootmenu.prompt->text);
>
>        gtk_widget_show(main_wnd);
>  }
This breaks `gconfig' because init_main_window() is being called
before conf_parse(). Would it be ok to delay the window initialization
after the parsing ? Completely untested as I don't have access to a
$DISPLAY yet:


@@ -1527,12 +1535,6 @@ int main(int ac, char *av[])
        else
                glade_file = g_strconcat(g_get_current_dir(), "/",
av[0], ".glade", NULL);

-       /* Load the interface and connect signals */
-       init_main_window(glade_file);
-       init_tree_model();
-       init_left_tree();
-       init_right_tree();
-
        /* Conf stuffs */
        if (ac > 1 && av[1][0] == '-') {
                switch (av[1][1]) {
@@ -1552,6 +1554,12 @@ int main(int ac, char *av[])
        fixup_rootmenu(&rootmenu);
        conf_read(NULL);

+       /* Load the interface and connect signals */
+       init_main_window(glade_file);
+       init_tree_model();
+       init_left_tree();
+       init_right_tree();
+

 - Arnaud
