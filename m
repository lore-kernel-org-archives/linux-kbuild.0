Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:47659 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756755Ab0JUCXA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Oct 2010 22:23:00 -0400
Received: by wyb28 with SMTP id 28so4540459wyb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2010 19:22:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100817082732.GA26082@sepie.suse.cz>
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
	<20100817082732.GA26082@sepie.suse.cz>
Date: Wed, 20 Oct 2010 22:22:58 -0400
Message-ID: <AANLkTimaeNoK9yDyoFHma_zLu+euSjXfni298_nEKHWK@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: don't assign `stdout' and `stderr'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nir Tzachar <nir.tzachar@gmail.com>

Hi Michal,

On Tue, Aug 17, 2010 at 4:27 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Mon, Aug 16, 2010 at 12:19:03AM -0400, Arnaud Lacombe wrote:
>> These may not be modifiable, as per C99 comment:
>>
>> section 7.19.5.4, note 232:
>> "
>> The primary use of the freopen function is to change the file associated with a
>> standard text stream (stderr, stdin, or stdout), as those identifiers need not
>> be modifiable lvalues to which the value returned by the fopen function may be
>> assigned.
>> "
>>
>> Use a duplicate of stdout as ncurses' output terminal, then redirect it
>> to /dev/null for conf_write().
>
> I would much rather get rid of this redirection completely. The config
> library should not play with stdout, but let the frontends display
> messages as they wish. This patch does it for nconfig. Nir, what do you
> think?
>
any news about this ? AFAICS, it not in `kbuild/kconfig'.

Thanks,
 - Arnaud

>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index dc11d51..c07060a 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -19,6 +19,9 @@
>  static void conf_warning(const char *fmt, ...)
>        __attribute__ ((format (printf, 1, 2)));
>
> +static void conf_message(const char *fmt, ...)
> +       __attribute__ ((format (printf, 1, 2)));
> +
>  static const char *conf_filename;
>  static int conf_lineno, conf_warnings, conf_unsaved;
>
> @@ -35,6 +38,29 @@ static void conf_warning(const char *fmt, ...)
>        conf_warnings++;
>  }
>
> +static void conf_default_message_callback(const char *fmt, va_list ap)
> +{
> +       printf("#\n# ");
> +       vprintf(fmt, ap);
> +       printf("\n#\n");
> +}
> +
> +static void (*conf_message_callback) (const char *fmt, va_list ap) =
> +       conf_default_message_callback;
> +void conf_set_message_callback(void (*fn) (const char *fmt, va_list ap))
> +{
> +       conf_message_callback = fn;
> +}
> +
> +static void conf_message(const char *fmt, ...)
> +{
> +       va_list ap;
> +
> +       va_start(ap, fmt);
> +       if (conf_message_callback)
> +               conf_message_callback(fmt, ap);
> +}
> +
>  const char *conf_get_configname(void)
>  {
>        char *name = getenv("KCONFIG_CONFIG");
> @@ -184,9 +210,8 @@ int conf_read_simple(const char *name, int def)
>                        name = conf_expand_value(prop->expr->left.sym->name);
>                        in = zconf_fopen(name);
>                        if (in) {
> -                               printf(_("#\n"
> -                                        "# using defaults found in %s\n"
> -                                        "#\n"), name);
> +                               conf_message(_("using defaults found in %s"),
> +                                        name);
>                                goto load;
>                        }
>                }
> @@ -651,9 +676,7 @@ next:
>                        return 1;
>        }
>
> -       printf(_("#\n"
> -                "# configuration written to %s\n"
> -                "#\n"), newname);
> +       conf_message(_("configuration written to %s"), newname);
>
>        sym_set_change_count(0);
>
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 9a948c9..481d484 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -1,3 +1,4 @@
> +#include <stdarg.h>
>
>  /* confdata.c */
>  P(conf_parse,void,(const char *name));
> @@ -8,6 +9,7 @@ P(conf_write,int,(const char *name));
>  P(conf_write_autoconf,int,(void));
>  P(conf_get_changed,bool,(void));
>  P(conf_set_changed_callback, void,(void (*fn)(void)));
> +P(conf_set_message_callback, void,(void (*fn)(const char *fmt, va_list ap)));
>
>  /* menu.c */
>  P(rootmenu,struct menu,);
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 18a215d..16233a9 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -651,25 +651,6 @@ static const char *set_config_filename(const char *config_filename)
>        return menu_backtitle;
>  }
>
> -/* command = 0 is supress, 1 is restore */
> -static void supress_stdout(int command)
> -{
> -       static FILE *org_stdout;
> -       static FILE *org_stderr;
> -
> -       if (command == 0) {
> -               org_stdout = stdout;
> -               org_stderr = stderr;
> -               stdout = fopen("/dev/null", "a");
> -               stderr = fopen("/dev/null", "a");
> -       } else {
> -               fclose(stdout);
> -               fclose(stderr);
> -               stdout = org_stdout;
> -               stderr = org_stderr;
> -       }
> -}
> -
>  /* return = 0 means we are successful.
>  * -1 means go on doing what you were doing
>  */
> @@ -695,9 +676,7 @@ static int do_exit(void)
>        /* if we got here, the user really wants to exit */
>        switch (res) {
>        case 0:
> -               supress_stdout(0);
>                res = conf_write(filename);
> -               supress_stdout(1);
>                if (res)
>                        btn_dialog(
>                                main_window,
> @@ -707,19 +686,6 @@ static int do_exit(void)
>                                  "changes were NOT saved."),
>                                  1,
>                                  "<OK>");
> -               else {
> -                       char buf[1024];
> -                       snprintf(buf, 1024,
> -                               _("Configuration written to %s\n"
> -                                 "End of Linux kernel configuration.\n"
> -                                 "Execute 'make' to build the kernel or try"
> -                                 " 'make help'."), filename);
> -                       btn_dialog(
> -                               main_window,
> -                               buf,
> -                               1,
> -                               "<OK>");
> -               }
>                break;
>        default:
>                btn_dialog(
> @@ -1255,6 +1221,14 @@ static void conf(struct menu *menu)
>        }
>  }
>
> +static void conf_message_callback(const char *fmt, va_list ap)
> +{
> +       char buf[1024];
> +
> +       vsnprintf(buf, sizeof(buf), fmt, ap);
> +       btn_dialog(main_window, buf, 1, "<OK>");
> +}
> +
>  static void show_help(struct menu *menu)
>  {
>        struct gstr help = str_new();
> @@ -1477,16 +1451,8 @@ static void conf_save(void)
>                case 0:
>                        if (!dialog_input_result[0])
>                                return;
> -                       supress_stdout(0);
>                        res = conf_write(dialog_input_result);
> -                       supress_stdout(1);
>                        if (!res) {
> -                               char buf[1024];
> -                               sprintf(buf, "%s %s",
> -                                       _("configuration file saved to: "),
> -                                       dialog_input_result);
> -                               btn_dialog(main_window,
> -                                          buf, 1, "<OK>");
>                                set_config_filename(dialog_input_result);
>                                return;
>                        }
> @@ -1579,6 +1545,7 @@ int main(int ac, char **av)
>                                _(menu_no_f_instructions));
>        }
>
> +       conf_set_message_callback(conf_message_callback);
>        /* do the work */
>        while (!global_exit) {
>                conf(&rootmenu);
>
